import SwiftUI
import Combine

@Observable
public class OnboardingViewModel{
    
    var currentPage: Int = 0
    @ObservationIgnored  @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var pages:[OnboardingScreen]{
        OnboardingScreen.OnbdSecreens
    }
    
    var isLastPage: Bool {
        currentPage == pages.count - 1
    }
  
    
    func goToNextPage() {
            if isLastPage {
                finishOnboarding()
            } else {
                withAnimation {
                    currentPage += 1
                }
            }
        }
    
    func goToPreviousPage() {
        if currentPage > 0{
            withAnimation{
                currentPage -= 1
            }
        }
    }
    
    func skipToLastPage() {
          withAnimation {
              currentPage = pages.count - 1
          }
      }
      
      func finishOnboarding() {
          withAnimation {
              hasCompletedOnboarding = true
          }
      }
    
    
}

