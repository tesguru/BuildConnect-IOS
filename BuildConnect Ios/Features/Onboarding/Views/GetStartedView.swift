import SwiftUI
import SwiftData

struct GetStartedView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var profiles: [UserProfile]
    @State private var path: [AuthRouteModel] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Image("Get_started")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Spacer()

                    Text("Get quality projects, showcase, grow your work")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.workSansExtraBold(26))
                        .padding(20)

                    RoleToggle(selected: selectedRole)
                        .padding(.horizontal, 24)

                    Button {
                        path.append(.signUp)
                    } label: {
                        Text("Create account")
                            .font(.interMedium(18))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Capsule().fill(Color.blue))
                    }
                    .padding(.horizontal, 24)

                    Text("By continuing, you agree to our \(Text("Terms of Service").bold().underline()) and \(Text("Privacy Policy").bold().underline())")
                        .font(.interMedium(14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Button {
                            path.append(.login)
                        } label: {
                            Text("Login").underline()
                        }
                    }
                    .font(.interMedium(16))
                    .foregroundStyle(.white)
                }
                .padding(.bottom, 60)
            }
           
            .navigationDestination(for: AuthRouteModel.self) { route in
                switch route {
                case .signUp:
                    SignUpView()
                case .login:
                    LoginView()
                }
            }
        }
    }

    private var selectedRole: Binding<UserRoleModel> {
        Binding(
            get: { profiles.first?.role ?? .Client },
            set: { newRole in save(newRole) }
        )
    }

    private func save(_ role: UserRoleModel) {
        if let existing = profiles.first {
            existing.role = role
        } else {
            modelContext.insert(UserProfile(role: role))
        }
    }
}

#Preview {
    GetStartedView()
        .modelContainer(for: UserProfile.self, inMemory: true)
}
