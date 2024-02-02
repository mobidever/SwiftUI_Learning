//
//  ItemDetail.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct ItemDetail: View {
	
	@EnvironmentObject var order: Order
	
	@State  var item: MenuItem
    var body: some View {
		VStack{
			ZStack(alignment: .bottomTrailing){
				Image(item.mainImage)
					.resizable()
					.scaledToFit()
				Text("Photo:\(item.photoCredit)")
					.padding(4)
					.background(.black)
					.font(.caption)
					.foregroundStyle(.white)
					.offset(x: -25, y: -15)
			}
			
			Text(item.description)
				.padding()
			Button("Order this" ) {
				order.add(item: item)
			}
			.font(.headline)
			.foregroundColor(.white)
			.buttonStyle(.borderedProminent)
			Spacer()
		}
		.navigationTitle(item.name)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar(content: {
			Button("Favourite"){
				//Update the logic to add item to Favourite array
				//item.isFavourite = item.isFavourite ?? true
				if (item.isFavourite == true)
				{
				
				}
				
				
			}
		})
    }
}

#Preview {
	NavigationStack{
		ItemDetail(item: MenuItem.example)
	}
	
}
