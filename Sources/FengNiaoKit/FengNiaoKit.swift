import Foundation
import PathKit
public struct FileInfo {
    let path: String
    
}

public struct FengNiao {
    let projectPath: Path
    let excludedPaths: [Path]
    let resourceExtensions:[String]
    let fileExtensions: [String]
    public init(projectPath: String, excludedPaths: [String],resourceExtensions:[String],fileExtensions: [String]) {
        let path = Path(projectPath).absolute()
        self.projectPath = path
        self.excludedPaths = excludedPaths.map{ path+Path($0) }
        self.resourceExtensions = resourceExtensions
        self.fileExtensions = fileExtensions
    }
    
    public func unusedResource() -> [FileInfo] {
        fatalError()
    }
    
    func stringsInUse() -> [String] {
        
        return []
    }
    
    func resourcesInUse() -> [String: String] {
        fatalError()
    }
    
    public func delete() -> () {
        
    }
    
    
    
    
}








































