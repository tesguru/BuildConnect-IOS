import SwiftData
import Foundation

@Model
final class UserProfile {
    var role: UserRoleModel
    var createdAt: Date
    
    init (role: UserRoleModel){
        self.role = role
        self.createdAt = Date()
    }
}
