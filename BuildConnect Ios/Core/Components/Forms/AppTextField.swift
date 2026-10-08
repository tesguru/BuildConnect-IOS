import SwiftUI

struct AppTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.interMedium(16))
                .foregroundStyle(.black)

            TextField(placeholder, text: $text)
                .keyboardType(keyboard)
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


