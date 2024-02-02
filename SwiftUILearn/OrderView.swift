//
//  OrderView.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct OrderView: View {
	
	@EnvironmentObject var order: Order;
	
	func deleteItems(at offsets: IndexSet) {
		order.items.remove(atOffsets: offsets)
	}
	
    var body: some View {
		NavigationStack{
			List{
				Section{
					ForEach(order.items){ item in
						HStack {
							Text(item.name)
							Spacer()
							Text("$\(item.price)")
						}
					}.onDelete(perform: { indexSet in
						deleteItems(at: indexSet)
					})
				}
				Section{
					NavigationLink("Place Order"){
						CheckoutView()
					}.disabled(order.items.isEmpty)
				}
				
			}
			.toolbar{
				EditButton()
			}
			.navigationTitle("Order")
		}
    }
}

#Preview {
	OrderView().environmentObject(Order())
}
