import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.interMedium(18))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Capsule().fill(Color.blue))
        }
    }
}

#Preview {
    PrimaryButton(title: "Create account") {
        print("tapped")
    }
    .padding()
}
