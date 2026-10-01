import Foundation

struct OnboardingScreen: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    let ImageBackground: String
    
    
    static let OnbdSecreens: [OnboardingScreen] = [
        
        OnboardingScreen(
            title:"Find Your Dream Home With Us",
            description: "Discover your perfect home or investment property with ease.",
            ImageBackground:"Onboarding1"
        ),
        OnboardingScreen(
            title:"Track Progress",
            description: "Monitor milestones, payments, and media updates in one centralized dashboard",
            ImageBackground:"Onboarding2"
        ),
        OnboardingScreen(
            title:"Let Find Your Dream Property",
            description: "Start your journey today and make your real estate dream",
            ImageBackground:"Onboarding3"
        )
        
    ]
        
    
}

