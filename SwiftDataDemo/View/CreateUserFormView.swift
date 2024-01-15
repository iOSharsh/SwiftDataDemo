//  CreateUserFormView.swift
//  SwiftDataDemo

import SwiftUI

struct CreateUserView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var txtName: String = ""
    @State private var txtDesignation: String = ""
    @State private var txtCompanyName: String = ""
    @State private var txtEmpyId: Int = 0
    @Binding var isSheetOpen: Bool
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter Name", text: $txtName)
                .textFieldStyle(MyTextFieldStyle())
            TextField("Enter Designation", text: $txtDesignation)
                .textFieldStyle(MyTextFieldStyle())
            TextField("Enter Comapny Name", text: $txtCompanyName)
                .textFieldStyle(MyTextFieldStyle())
            TextField("Enter Number", value: $txtEmpyId, formatter: numberFormatter)
                .textFieldStyle(MyTextFieldStyle())
                .keyboardType(.numberPad)
            Button(action: {
                addItem()
            }, label: {
                Text("Save")
            })
            .padding(.top, 20)
        }
        .padding([.leading, .trailing], 20)
    }
    
    
    private func addItem() {
        
            let newItem = UserDetails(name: txtName, 
                                      empId: txtEmpyId,
                                      designationOfEmploye: txtDesignation, 
                                      companyName: txtCompanyName)
            modelContext.insert(newItem)
            isSheetOpen = false
    }
}

#Preview {
    CreateUserView(isSheetOpen: Binding.constant(false))
}
