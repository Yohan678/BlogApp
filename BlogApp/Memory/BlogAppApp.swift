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
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
