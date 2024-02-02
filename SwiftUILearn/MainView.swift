//
//  MainView.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct MainView: View {
	@EnvironmentObject var order: Order
	
    var body: some View {
        
		TabView {
			ContentView().tabItem {
				Label("Menu", systemImage: "list.dash")
			}.environmentObject(order)
			OrderView().tabItem {
				Label("Order", systemImage: "square.and.pencil")
			}.environmentObject(order)
			Favourites().tabItem {
				Label("Favourites", systemImage: "star")
			}
		}
    }
}

#Preview {
    MainView()
}
