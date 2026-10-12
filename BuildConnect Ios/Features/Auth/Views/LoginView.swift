
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var path: [AuthRouteModel]

    var body: some View {
        VStack(spacing:20){
            Image("build_connect_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 140)
               
            Text("Login to your account")
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .font(.workSansRegular(26))
                .padding(.bottom, 20)
            VStack(spacing:16){
                
               

                AppTextField(title: "Email", placeholder: "user@gmail.com", text: $email, keyboard: .emailAddress)
                
                
               
                
                PasswordTextField(title: "Password", placeholder: "Password (8 or more characters)", text: $password)
                
                
                PrimaryButton(title: "Login to your account") {
                    
                }
               
                .padding(.top, 10)
                
                HStack(spacing: 4) {
                    Text("Already have an account?")
                    Button {
                        print("tapped sign up")
                        path = [.signUp]
                    } label: {
                        Text("Sign Up").underline()
                    }
                }
                .font(.interMedium(16))
                .foregroundStyle(.black)
                
            }.padding(14)
            
            Spacer()
        }.padding(.top, 16)
    }
}

#Preview {
    LoginView(path: .constant([.login]))
}
