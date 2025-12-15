import SwiftUI

@main
struct NotHotdogApp : App
{
    @StateObject var historyViewModel = HistoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                AnalyzePhotoView()
                    .environmentObject(historyViewModel)
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Analyze")
                    }
                HistoryView()
                    .environmentObject(historyViewModel)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("History")
                    }
                SettingsView()
                    .environmentObject(historyViewModel)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
    }
}
