import SwiftUI

struct SettingsView : View
{
    @EnvironmentObject var history : HistoryViewModel
    var body : some View {
        NavigationView {
            Form {
                Section(header: Text("About"),
                        footer: Text("Inspired by the HBO Original series Silicon Valley.")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0").foregroundColor(.secondary)
                    }
                    NavigationLink(destination : DevInfoView()) {
                        HStack {
                            Text("Developer")
                            Spacer()
                            Text("HangSoftware").foregroundColor(.secondary)
                        }
                    }
                }
                Section(){
                    Button(action: {
                        history.results.removeAll()
                    }) {
                        Text("Clear History")
                    }
                }
                .navigationTitle(Text("Settings"))
            }
        }
    }
}

#Preview {
    SettingsView().environmentObject(HistoryViewModel())
}
