import Foundation

struct AuthServices {
    private let  apiClient = APIClient.shared
  
    
    func signUpAccount (userRequest: SignUpModelRequest) async throws  -> SignUpModelResponse{
        let body = userRequest
        return try await apiClient.post(
                   "auth/signup",
                   body: body
               )
    }
    
    func loginAccount (login: LoginModelRequest) async throws  ->  LoginModelResponse {
        let body = login
        return try await apiClient.post(
            "auth/login",
            body: body
        )
    }
    
  
}

