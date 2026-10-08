import SwiftUI

struct RoleToggle: View {
    @Binding var selected: UserRoleModel
   
    var body: some View {
        HStack(spacing: 0) {
            option("I'm a Client", role: .Client)
            option("I'm a Builder", role: .Builder)
        }
        .padding(4)
        .background(Capsule().fill(.white.opacity(0.2)))   // layer 1: grey pill
    }

    private func option(_ title: String, role: UserRoleModel) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.25)) {
                selected = role
            }
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .foregroundStyle(selected == role ? .black : .white.opacity(0.7))   // layer 3: text
                .background {
                    if selected == role {
                        Capsule().fill(.white)             // layer 2: white pill
                    }
                }
        }
        .buttonStyle(.plain)
    }
}
