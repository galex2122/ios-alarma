import SwiftUI

struct PreferencesView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 30.0){
            
            Text("Signed in as \(authViewModel.getUserEmail())")
                .font(.headline)
            
            Button(
                action: {
                    authViewModel.signOut()
                }
            ){
                Text("Sign out")
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .padding([.top, .bottom], 8)
            }
            .background(Capsule()
                            .fill(.green))
            .foregroundColor(.white)
        }
        .padding()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
