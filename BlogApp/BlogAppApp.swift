//
//  BlogAppApp.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import SwiftUI

@main
struct BlogAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
