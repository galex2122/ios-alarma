import Foundation
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self]result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signOut(){
        do{
        try auth.signOut()
        } catch{
            print("Error while signing out: \(error)")
            return
        }
        DispatchQueue.main.async {
            self.signedIn = false
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func getUserEmail() -> String {
        guard auth.currentUser?.email != nil
        else {
            return " "
        }
        return (auth.currentUser?.email)!
    }
    
}
