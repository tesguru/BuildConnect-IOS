

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack {
                Image("splash-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text("Your trusted construction partner")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SplashView()
}
