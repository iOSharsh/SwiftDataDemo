import Foundation
import SwiftData

@Model
 final class UserDetails {
    var name: String
     @Attribute(.unique) let empId: Int
    var designationOfEmploye: String
    var companyName: String = ""
     
     init(name: String, empId: Int, designationOfEmploye: String, companyName: String) {
         self.name = name
         self.empId = empId
         self.designationOfEmploye = designationOfEmploye
         self.companyName = companyName
     }
}
