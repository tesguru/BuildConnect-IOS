import SwiftUI

struct PasswordTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    @State private var isHidden = true

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // 1. The label
            Text(title)
                .font(.interMedium(16))
                .foregroundStyle(.black)

            // 2. The box
            HStack {
                if isHidden {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }

                Button {
                    isHidden.toggle()
                } label: {
                    Image(systemName: isHidden ? "eye" : "eye.slash")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}

#Preview {
    struct Demo: View {
        @State private var password = ""
        var body: some View {
            PasswordTextField(
                title: "Password",
                placeholder: "Password (8 or more characters)",
                text: $password
            )
            .padding()
        }
    }
    return Demo()
}
