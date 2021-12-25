import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationView{
        if(authViewModel.signedIn){
            MainView()
        }else {
            LoginView()
        }
        }.onAppear {
            authViewModel.signedIn = authViewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
