

import SwiftUI
import SwiftData

@main
struct BuildConnect_IosApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: UserProfile.self)
    }
    
}
