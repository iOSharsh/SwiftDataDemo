//
//  HomeView.swift
//  SwiftDataDemo

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [UserDetails]
    @State  var isSheetOpen: Bool = false
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            isSheetOpen = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
                .sheet(isPresented: $isSheetOpen, content: {
                    CreateUserView(isSheetOpen: $isSheetOpen)
                        .presentationDetents([.medium])
                        .presentationCornerRadius(50)
                })
                
        }
    }

    var content: some View {
        if items.isEmpty {
            return AnyView(Text("No data found"))
        } else {
            return AnyView(
                List(items, id: \.self) { item in
                    NavigationLink(value: item) {
                        VStack(alignment: .leading) {
                            Text("ID - \(item.empId)")
                            Text("Name - \(item.name)")
                            Text("Designation - \(item.designationOfEmploye)")
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(item)
                        }
                    }
                }
                    .navigationDestination(for: UserDetails.self, destination: { value in
                        EditUserView(userDetails: value)
                    })
            )
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: UserDetails.self, inMemory: true)
}
