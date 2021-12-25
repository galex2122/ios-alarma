import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var user = ""
    @State var password = ""
    
    var body: some View {
        
        VStack {
            Text("Sign In")
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
            }.padding(.horizontal, 8.0)
            
            VStack(alignment: .center, spacing: 46.0){
                Button(action: {
                    guard !user.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    if(!viewModel.isValidEmail(user)){
                        return
                    }
                    
                    viewModel.signIn(email: user, password: password)
                }){
                    Text("Sign In")
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .padding([.top, .bottom], 8)
                }
                .background(Capsule()
                                .fill(.green))
                .foregroundColor(.white)
                
                HStack{
                    Text("Don't have an account?")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        
                    }){
                        NavigationLink(destination: RegistrationView()){
                            Text("Sign Up")
                                .font(.caption)
                        }
                    }
                }
                
            }.padding()
        }.padding()
    
}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
