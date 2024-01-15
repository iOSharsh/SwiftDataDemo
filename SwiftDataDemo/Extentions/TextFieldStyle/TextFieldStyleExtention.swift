import Foundation
import SwiftUI
struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


/*
 var sharedModelContainer: ModelContainer = {
    let path =  FileManager
         .default
         .urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
     let dbUrlUSerDetails = path.appendingPathComponent("UserDetails.db")
     
     let schema = Schema([
         UserDetails.self
     ])
     let modelConfiguration1 = ModelConfiguration( schema: schema, url: dbUrlUSerDetails)
     do {
         return try ModelContainer(for: schema, configurations: [modelConfiguration1])
     } catch {
         fatalError("Could not create ModelContainer: \(error)")
     }
 }()
 */
