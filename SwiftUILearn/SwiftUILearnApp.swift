//
//  SwiftUILearnApp.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

@main
struct SwiftUILearnApp: App {
    let persistenceController = PersistenceController.shared
	@StateObject var order = Order()
	
    var body: some Scene {
        WindowGroup {
			MainView()
				.environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
