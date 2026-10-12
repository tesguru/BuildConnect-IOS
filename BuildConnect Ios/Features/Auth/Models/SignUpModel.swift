import Foundation


struct SignUpModelRequest:Codable{
var firstName: String
var LastName:String
var phoneNumber: String
var email: String
var password: String
var role: UserRoleModel
}

struct SignUpModelResponse: Decodable {
    let code: String
    let data: SignUpData
    let message: String
    let reqId: String
    let statusCode: Int
    let success: Bool
}

struct SignUpData: Decodable {
    let authToken: String
    let refreshToken: String
    let user: SignUpUser
}

struct SignUpUser: Decodable {
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



