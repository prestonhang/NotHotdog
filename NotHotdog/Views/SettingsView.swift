import SwiftUI

struct SettingsView : View
{
    var body : some View
    {
        NavigationView
        {
            Form
            {
                Section(header: Text("About"),
                        footer: Text("Inspired by the HBO Original series Silicon Valley."))
                {
                    HStack
                    {
                        Text("Version")
                        Spacer()
                        Text("1.0.0").foregroundColor(.secondary)
                    }
                    NavigationLink(destination : DevInfoView())
                    {
                        HStack
                        {
                            Text("Developer")
                            Spacer()
                            Text("HangSoftware").foregroundColor(.secondary)
                        }
                    }
                }
                Section()
                {
                    Text("Clear History")
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

#Preview
{
    SettingsView()
}
