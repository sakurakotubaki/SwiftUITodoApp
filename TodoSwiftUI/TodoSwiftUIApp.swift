import SwiftUI

@main
struct TodoSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Todo.self])
    }
}
