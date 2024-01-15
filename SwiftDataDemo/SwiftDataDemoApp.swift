//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
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
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}

