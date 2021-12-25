import SwiftUI
import Firebase
import FirebaseAuth

struct RegistrationView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var user = ""
    @State var password = ""
    @State var passwordRepeat = ""
    
    var body: some View {
        VStack () {
            Text("Sign Up")
                .fontWeight(.heavy)
                .padding(20)
                .font(.largeTitle)
                .foregroundColor(.green)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 2.0){
                    Text("E-mail")
                        .fontWeight(.light)
                        .font(.caption)
                        .foregroundColor(.gray)
                    HStack{
                        TextField("Enter your E-mail", text: $user)
                            .font(.headline)
                            
                    }
                }.padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 2.0){
                    Text("Password")
                        .fontWeight(.light)
                        .font(.caption)
                        .foregroundColor(.gray)
                    HStack{
                        SecureField("Enter your password", text: $password)
                            .font(.headline)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 2.0){
                    Text("Confirm password")
                        .fontWeight(.light)
                        .font(.caption)
                        .foregroundColor(.gray)
                    HStack{
                        SecureField("Re-enter your password", text: $passwordRepeat)
                            .font(.headline)
                    }
                }.padding(.bottom, 20)
            }.padding(.horizontal, 8.0)
            
            VStack(alignment: .center, spacing: 46.0){
                Button(action: {
                    guard !user.isEmpty, !password.isEmpty, !passwordRepeat.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: user, password: password)
                }){
                    Text("Sign Up")
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .padding([.top, .bottom], 8)
                }
                .background(Capsule()
                                .fill(.green))
                .foregroundColor(.white)
                .disabled(user.isEmpty || password.isEmpty || (password != passwordRepeat))
            }.padding()
            
            Spacer()
            
        }.padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
