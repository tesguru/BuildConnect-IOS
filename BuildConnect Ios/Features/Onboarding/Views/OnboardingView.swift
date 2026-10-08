
import SwiftUI

struct OnboardingView: View {
    @State private var viewModel = OnboardingViewModel()
 
    
    var body: some View {
        ZStack{
            Image(viewModel.pages[viewModel.currentPage].ImageBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
              
                HStack{
                    Spacer()
                    HStack {
                        if viewModel.currentPage > 0 {
                            Button {
                                viewModel.goToPreviousPage()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 20, weight: .semibold))
                            }
                        }

                        Spacer()

                        if !viewModel.isLastPage {
                            Button("Skip") { viewModel.skipToLastPage() }
                        }
                    }
                    .foregroundStyle(.black)
                    .font(.interMedium(18))
                    .padding(.horizontal, 13)
                    .padding(.top, 50)
                   
                    
                }
   
              
                
            Spacer()
              Spacer()
               
                TabView(selection: $viewModel.currentPage) {
            ForEach(viewModel.pages.indices, id: \.self) { index in
                    VStack {
       Text(viewModel.pages[index].title)
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .font(.workSansExtraBold(26))
        .padding(.horizontal, 24)

            Text(viewModel.pages[index].description)
        .multilineTextAlignment(.center)
            .font(.workSansRegular(18))
                .foregroundStyle(.white)
            .padding()
                                       }
                                       .tag(index)
                                   }
                               }
                               .tabViewStyle(.page(indexDisplayMode: .never))
                               .frame(height: 200)
                               .padding(.top, 200)

                               
                               ProgressArrowButton(
                                progress: CGFloat(viewModel.currentPage + 1) / CGFloat(viewModel.pages.count),
                                onTap: { viewModel.goToNextPage()
                                }
                                  
                               )
                               .id(viewModel.currentPage)
                
                Spacer()
                    
                }
                
               
            
          
        }
    }
}


#Preview {
    OnboardingView()
}
