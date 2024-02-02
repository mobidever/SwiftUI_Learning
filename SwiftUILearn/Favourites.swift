//
//  Favourites.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct Favourites: View {
	let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
	
	//TODO: Update the logic to get Favourite items from seperate array
    var body: some View {
		List{
			ForEach(menu){ menuitem in
				ForEach(menuitem.items) { item in
						Text(item.name)
				}
				
			}
		}
    }
}

#Preview {
    Favourites()
}
