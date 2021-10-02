import Foundation

public struct ShellCommands {
    public static let executableURL = ProcessInfo
                                        .processInfo
                                        .isOperatingSystemAtLeast(
                                            OperatingSystemVersion(majorVersion: 10, minorVersion: 15, patchVersion: 0)
                                        ) ? "/bin/zsh" : "/bin/bash"
    
    public static let environment = ["PATH":"/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin"]
    
    public struct Result {
        public let statusCode: Int32
        public let output: String
        public let processId: Int32
    }
    
    public static func run(_ command: String, environment: [String: String]? = Self.environment, executableURL: String = Self.executableURL, currentDirectoryURL:String = "/Users/\(NSUserName())", dashc: String = "-c") -> Result {
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        
        // create process
        func create() -> Process {
            let process = Process()
            process.standardOutput = outputPipe
            process.standardError = errorPipe

            if #available(macOS 10.13, *) {
                process.executableURL = URL(fileURLWithPath: executableURL)
                process.currentDirectoryURL = URL(fileURLWithPath: currentDirectoryURL)
            } else {
                process.launchPath = "/bin/bash"
                process.currentDirectoryPath = currentDirectoryURL
            }
            if let environment = environment {
                process.environment = environment
            }
            process.arguments = [dashc, command]
            return process
        }
        
        // run process
        func run(_ process: Process) throws {
            if #available(macOS 10.13, *) {
                try process.run()
            } else {
                process.launch()
            }
            process.waitUntilExit()
        }
        
        // read data
        func fileHandleData(fileHandle: FileHandle) throws -> String? {
            var outputData: Data?
            if #available(macOS 10.15.4, *) {
                outputData = try fileHandle.readToEnd()
            } else {
                outputData = fileHandle.readDataToEndOfFile()
            }
            if let outputData = outputData {
                return String(data: outputData, encoding: .utf8)
            }
            return nil
        }
        
        let process = create()
        
        do {
            try run(process)
            
            let outputActual = try fileHandleData(fileHandle: outputPipe.fileHandleForReading) ?? ""
            let errorActual = try fileHandleData(fileHandle: errorPipe.fileHandleForReading) ?? ""
            
            if process.terminationStatus == EXIT_SUCCESS {
                return Result(statusCode: process.terminationStatus, output: outputActual, processId: process.processIdentifier)
            }
            return Result(statusCode: process.terminationStatus, output: errorActual, processId: process.processIdentifier)
        } catch let error {
            return Result(statusCode: process.terminationStatus, output: error.localizedDescription, processId: process.processIdentifier)
        }
    }
}
