import SwiftUI

struct AgreementCheckBox: View {
    @Binding var isChecked: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button {
                isChecked.toggle()
            } label: {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .font(.system(size: 28))
                    .foregroundStyle(isChecked ? Color.blue : .gray.opacity(0.5))
            }
            .buttonStyle(.plain)

            Text(agreementText)
                .font(.interMedium(16))
                .foregroundStyle(.black)
        }
    }

    private var agreementText: AttributedString {
        var text = AttributedString("By creating an account, you agree to our Terms of Service and Privacy Policy of BuildConnect")

        if let range = text.range(of: "Terms of Service") {
            text[range].foregroundColor = .blue
            text[range].link = URL(string: "https://yourwebsite.com/terms")
        }
        if let range = text.range(of: "Privacy Policy of BuildConnect") {
            text[range].foregroundColor = .blue
            text[range].link = URL(string: "https://yourwebsite.com/privacy")
        }
        return text
    }
}

#Preview {
    struct Demo: View {
        @State private var agreed = false
        var body: some View {
            AgreementCheckBox(isChecked: $agreed)
                .padding()
        }
    }
    return Demo()
}
