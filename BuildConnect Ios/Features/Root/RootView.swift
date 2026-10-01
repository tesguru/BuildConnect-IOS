import SwiftUI

struct RootView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                SplashView()
                    .transition(.opacity)
            } else if hasCompletedOnboarding {
                ContentView()          
            } else {
                OnboardingView()
            }
        }
        .task {
            await bootstrap()
            withAnimation(.easeInOut(duration: 0.4)) {
                isLoading = false
            }
        }
    }

    private func bootstrap() async {
       
        try? await Task.sleep(for: .seconds(1.2))
    }
}
