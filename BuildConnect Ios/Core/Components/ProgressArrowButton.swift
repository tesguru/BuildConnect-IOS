import SwiftUI

struct ProgressArrowButton: View {
    var progress: CGFloat          // 0.0 to 1.0, you decide
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            ZStack {
                // Button face
                Circle()
                    .fill(Color(white: 0.95))
                    .padding(8)

                Image(systemName: "arrow.right")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.black)

                // Track ring
                Circle()
                    .stroke(Color.white.opacity(0.9), lineWidth: 3)

                // Progress ring
                Circle()
                    .trim(from: 0, to: min(max(progress, 0), 1)) // keeps it between 0 and 1
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: 76, height: 76)
        }
        .buttonStyle(.plain)
    }
}
