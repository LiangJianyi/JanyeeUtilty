import Foundation

public class FileNode: Equatable, CustomStringConvertible {
    public var path: String
    public lazy var url: URL = URL(fileURLWithPath: self.path)
    public lazy var parentNode: (FileNode?, FileNodeError?) = self.getParentNode()
    
    public var description: String {
        return self.path
    }
    
    public lazy var subNode: (
        result: LazyMapSequence<LazySequence<[String]>.Elements, FileNode>?,
        errorHandler: FileNodeError?
    ) = self.getSubNode()
    
    // 如果路径的结尾含有若干斜杆“/”，将它们移除
    private static func removeLastSlash(_ p: inout String) {
        // 如果路径是根目录，则不做任何处理
        if p != NSOpenStepRootDirectory() {
            var components: [String] = URL(fileURLWithPath: p).pathComponents
            if components.last! == "/" {
                components = components.dropLast()
                p = URL(pathComponents: components).path
            }
        }
    }
    
    public init(path: String) throws {
        self.path = path
        FileNode.removeLastSlash(&self.path)
        
        // 检查路径对应的文件是否存在
        if FileManager.default.fileExists(atPath: self.path) == false {
            throw FileNodeError.fileNotExists(path: path)
        }
    }
    
    private init(brokenPath: String) {
        self.path = brokenPath
    }
    
    public func isDirectory() throws -> Bool {
        if #available(macOS 10.11, *) {
            return self.url.hasDirectoryPath
        } else {
            // Fallback on earlier versions
            do {
                let _ = try FileManager.default.contentsOfDirectory(atPath: self.path)
                return true
            } catch let error as NSError {
                switch error.code {
                case 256:
                    return false
                case 260:
                    throw FileNodeError.fileNotExists(path: self.path)
                default:
                    throw error
                }
            }
        }
    }
    
    public func getParentNode() -> (parentNode: FileNode?, errorHandler: FileNodeError?) {
        if self.path != NSOpenStepRootDirectory() {
            let url = URL(fileURLWithPath: self.path)
            let parentPathComponents = url.pathComponents[0..<(url.pathComponents.count - 1)]
            let newUrl = URL(pathComponents: parentPathComponents)
            do {
                let parent = try FileNode(path: newUrl.path)
                return (parentNode: parent, errorHandler: nil)
            } catch FileNodeError.fileNotExists(let p) {
                return (parentNode: nil, errorHandler: .fileNotExists(path: p))
            } catch let error as NSError {
                return (parentNode: nil, errorHandler: .unkownError(error: error))
            }
        } else {
            return (parentNode: nil, errorHandler: nil)
        }
    }
    
    private func getSubNode() -> (result: LazyMapSequence<LazySequence<[String]>.Elements, FileNode>?,
                                  errorHandler: FileNodeError?) {
        // FileManager.default.contentsOfDirectory 返回的子目录是相对路径，
        // 该函数将其转换为绝对路径
        func relativePathConvertToAbsolutePath(basePath: String, targetPath: String) -> String {
            if FileManager.default.fileExists(atPath: basePath) {
                return (URL(fileURLWithPath: basePath).appendingPathComponent(targetPath)).path
            } else {
                fatalError("\(basePath) is not exists.")
            }
        }
        
        do {
            let lazyContensOfDir = try FileManager.default.contentsOfDirectory(atPath: self.path).lazy
            let res: LazyMapSequence<LazySequence<[String]>.Elements, FileNode>? = lazyContensOfDir.map{
                do {
                    let fullPath = relativePathConvertToAbsolutePath(basePath: self.path, targetPath: $0)
                    return try FileNode(path: fullPath)
                } catch FileNodeError.fileNotExists(let p) {
                    // 可能是个 broken symbolic link
                    return FileNode(brokenPath: p)
                } catch let error as NSError {
                    fatalError("Unkown error. Error code=\(error.code).\n\(error.localizedDescription)")
                }
            }
            return (result: res, errorHandler: nil)
        } catch let error as NSError {
            switch error.code {
            case 256:   // File is not a directory
                return (result: nil, errorHandler: .notDirectory)
            case 257:   // Permission denied
                return (result: nil, errorHandler: .permissionDenied)
            default:
                return (result: nil, errorHandler: .unkownError(error: error))
            }
        }
    }
    
    public static func == (lhs: FileNode, rhs: FileNode) -> Bool {
        return lhs.path == rhs.path
    }
}

extension String {
    init(stringArray: [String]) {
        self.init(stringArray.reduce(""){ $0.appending($1) })
    }
}

extension URL {
    init(pathComponents: [String]) {
        var url = URL(fileURLWithPath: pathComponents.first!)
        for path in pathComponents[1..<pathComponents.count] {
            url.appendPathComponent(path)
        }
        do {
            try self.init(resolvingAliasFileAt: url)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    init(pathComponents: ArraySlice<String>) {
        if pathComponents.count > 0 {
            if pathComponents[0] == NSOpenStepRootDirectory() {
                var path = pathComponents[0]
                for index in 1..<pathComponents.count {
                    path.append(pathComponents[index])
                    path.append("/")
                }
                self.init(fileURLWithPath: path)
            } else {
                var path = ""
                for index in 0..<pathComponents.count {
                    path.append(pathComponents[index])
                    path.append("/")
                    self.init(fileURLWithPath: path)
                }
                self.init(fileURLWithPath: path)
            }
        } else {
            self.init(fileURLWithPath: "")
        }
    }
}

public enum FileNodeError: Error {
    case fileNotExists(path: String)
    case brokenSymbolicLink
    case permissionDenied
    case notDirectory
    case unkownError(error: NSError)
}
