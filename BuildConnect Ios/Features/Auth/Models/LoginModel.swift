
import Foundation


struct LoginModelRequest: Codable {
    let email: String
    let password: String
}

struct LoginModelResponse: Decodable {
    let code: String
    let data: AuthData
    let message: String
    let reqId: String
    let statusCode: Int
    let success: Bool
}

struct AuthData: Decodable {
    let authToken: String
    let refreshToken: String
    let user: AuthUser
}

struct AuthUser: Decodable {
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    let mobileNumber: String
    let role: String
    let verificationStatus: String
    let isEmailVerified: Bool
    let isVerified: Bool
    let createdAt: String
    let updatedAt: String
}


