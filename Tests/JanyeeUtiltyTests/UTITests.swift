import XCTest
@testable import JanyeeUtilty

final class UTITests: XCTestCase {
    func testUTI() {
        let fileUrl = URL(fileURLWithPath: "demo.txt")
        let fileUTI = UTI(withExtension: fileUrl.pathExtension)
        switch fileUTI {
        case .pdf:
            print("\(fileUrl) is pdf file")
        case .jpeg:
            print("\(fileUrl) is jpg file")
        case .png:
            print("\(fileUrl) is png file")
        case .tiff:
            print("\(fileUrl) is tiff file")
        case .gif:
            print("\(fileUrl) is gif file")
        case .spreadsheet:
            print("\(fileUrl) is excel file")
        case .html:
            print("\(fileUrl) is html file")
        case .zipArchive:
            print("\(fileUrl) is zip file")
        case .docx, .doc:
            print("\(fileUrl) is dox file")
        case .plainText:
            print("\(fileUrl) is text file")
        default:
            print("fileUTI = \(fileUTI)")
        }
    }
}
