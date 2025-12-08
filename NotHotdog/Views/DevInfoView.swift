import SwiftUI

struct DevInfoView: View
{
    var body: some View
    {
        NavigationView{
            Form {
                Section(header: Text("Developer Info")){
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("HangSoftware").font(.title2).bold()
                            Text(
                            """
                            Hello, my name is Preston. I am a Software Engineer looking to develop skills in App Development.
                            
                            
                            Any feedback is appreciated!
                            """)
                            
                        }
                        .padding()
                        
                    }
                }
                
                Section(header: Text("Contact Me")){
                    Link(destination: URL(string:"prestontanhang@gmail.com")!){
                        Label("prestontanhang@gmail.com", systemImage: "envelope")
                    }
                    .buttonStyle(EmailButtonStyle())
                    Link(destination: URL(string:"https://www.linkedin.com/in/prestonhang/")!) {
                        HStack {
                            Image(.linkedin)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("LinkedIn")
                        }
                    }
                    .buttonStyle(LinkedInButtonStyle())
                    
                    Link(destination: URL(string:"https://github.com/prestonhang")!){
                        HStack
                        {
                            Image(.github)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("GitHub")
                        }
                    }
                    .buttonStyle(GitHubButtonStyle())
                }
            }
        }
    }
}
    
    struct EmailButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 1.0, green: 0.75, blue: 0.75))
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    struct LinkedInButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.00, green: 0.45, blue: 0.69))
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 0.50 : 1.0)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    struct GitHubButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.black)
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    #Preview
    {
        DevInfoView()
    }
    

struct GitHubLogo : View {
    var body: some View {
        Image("githublogo")
            .resizable()
            .frame(width: 32, height: 32)
    }
}
