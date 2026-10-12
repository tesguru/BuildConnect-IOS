
import SwiftUI
import SwiftData
                  
struct SignUpView: View {
    @Query private var profiles: [UserProfile]
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var country = PhoneService.shared.nigeria
    @State private var agreed = false
    @Binding var path: [AuthRouteModel]
    
    private var title: String {
           profiles.first?.role == .Client ? "Sign Up to hire Builders" : "Sign Up to Find Work"
       }
    var body: some View {
        ScrollView{
            VStack(spacing:18){
                Image("build_connect_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 140)
                   
                Text(title)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    .font(.workSansRegular(26))
                    .padding(.bottom, 20)
                VStack(spacing:16){
                    
                    HStack(spacing: 16) {
                        AppTextField(title: "First Name", placeholder: "Enter first name", text: $firstName)
                        AppTextField(title: "Last Name", placeholder: "Enter last name", text: $lastName)
                    }

                    AppTextField(title: "Email", placeholder: "user@gmail.com", text: $email, keyboard: .emailAddress)
                    
                    
                    PhoneTextField( country: $country, number: $phone,)
                    
                    PasswordTextField(title: "Password", placeholder: "Password (8 or more characters)", text: $password)
                    
                    AgreementCheckBox(isChecked: $agreed)
                        .padding()
                    
                    PrimaryButton(title: "Create account") {
                        
                    }
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Button {
                            path = [.login]      
                        } label: {
                            Text("Login").underline()
                        }
                    }
                    .font(.interMedium(16))
                    .foregroundStyle(.black)
                   
                    .padding(.top, 10)
                    
                }.padding(14)
                
                Spacer()
            }.padding(.top, 16)
        }
       
            
    }
}

#Preview {
    SignUpView(path: .constant([.signUp]))
}
