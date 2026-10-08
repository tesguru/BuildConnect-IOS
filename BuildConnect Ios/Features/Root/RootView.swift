import SwiftUI

struct RootView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                SplashView()
                    .transition(.opacity)
            } else if !hasCompletedOnboarding {
                OnboardingView()
            } else if !isLoggedIn {
                GetStartedView()
            } else {
                ContentView()      
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
