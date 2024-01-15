//
//  EditUserView.swift
//  SwiftDataDemo

import SwiftUI

struct EditUserView: View {
    var userDetails: UserDetails
   @State private var txtName: String = ""
   @State private var txtDesignation: String = ""
   @State private var txtCompanyName: String = ""
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter Name", text: $txtName)
                .textFieldStyle(MyTextFieldStyle())
            TextField("Enter Designation", text: $txtDesignation)
                .textFieldStyle(MyTextFieldStyle())
            TextField("Enter Comapny Name", text: $txtCompanyName)
                .textFieldStyle(MyTextFieldStyle())
            Spacer()
        }
        .onAppear(perform: {
            self.txtName = userDetails.name
            self.txtDesignation = userDetails.designationOfEmploye
            self.txtCompanyName = userDetails.companyName
        })
        .padding([.leading, .trailing], 20)
        .navigationTitle("Edit Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    updateData()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Update")
                })
            }
        }
    }
    
    private func updateData() {
        userDetails.name = txtName
        userDetails.companyName = txtCompanyName
        userDetails.designationOfEmploye = txtDesignation
    }
}

#Preview {
    EditUserView(userDetails: UserDetails(name: "", empId: 0, designationOfEmploye: "", companyName: ""))
}
