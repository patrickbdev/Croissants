import SwiftUI

@main
struct CroissantsApp: App {
    var body: some Scene {
        WindowGroup {
            if ProcessInfo.processInfo.isUnitTest == false {
                
            }
        }
    }
}

extension ProcessInfo {
    
    var isUnitTest: Bool {
        return environment["XCTestConfigurationFilePath"] != nil
    }
}
