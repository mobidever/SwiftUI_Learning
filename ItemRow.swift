//
//  ItemRow.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct ItemRow: View {
	let item: MenuItem
	let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var body: some View {
		HStack{
			Image(item.thumbnailImage)
				.clipShape(Circle())
				.overlay(Circle().stroke(.gray, lineWidth: 2))
			
			VStack( alignment: .leading, content: {
				Text(item.name)
					.font(.headline)
				Text("$\(item.price)")
			})
			Spacer()
			ForEach(item.restrictions, id: \.self) { restriction in
				Text(restriction)
					.font(.caption)
					.fontWeight(.black)
					.padding(5)
					.background(colors[restriction,default: .black])
					.clipShape(Circle())
					.foregroundColor(.white)
			}
			
		}
    }
}

#Preview {
	ItemRow(item: MenuItem.example)
}
