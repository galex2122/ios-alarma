import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        TabView{
            Text("Hello, World!")
                .tabItem{
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }
           PreferencesView()
                .tabItem{
                    Image(systemName: "gearshape.2.fill")
                    Text("Preferences")
                }
        }
        .accentColor(.green)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
