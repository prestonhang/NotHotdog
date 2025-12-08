import SwiftUI

@main
struct NotHotdogApp : App
{
    var body: some Scene {
        WindowGroup {
            TabView {
                AnalyzePhotoView()
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Analyze")
                    }
                HistoryView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("History")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
    }
}
