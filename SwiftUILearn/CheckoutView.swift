//
//  CheckoutView.swift
//  SwiftUILearn
//
//  Created by PS on 02/02/24.
//

import SwiftUI

struct CheckoutView: View {
	
	let paymentTypes : [String] = ["Cash","Credit Card","Rewards"]
	let pickupTime: [String] = ["Now","Tomorrow","Tonight"]
	let tipAmounts = [10, 15, 20, 25, 0]
	
	var totalPrice: String {
		let total = Double(order.total)
		let tipValue = total/100 * Double(tipAmount)
		return (total + tipValue).formatted(.currency(code: "USD"))
	}
	
	@State private var paymentType : String = "Cash"
	@State private var addLoyaltyPoints : Bool = false
	@State private var loyaltyPoints: String = ""
	@State private var tipAmount: Int = 5
	@State private var showPaymentAlert : Bool = false
	@State private var pickup: String = "Now"
	
	
	@EnvironmentObject var order: Order
	
    var body: some View {
        
		Form{
			
			Section{
				Picker("Pickup Time", selection: $pickup) {
					ForEach(pickupTime, id:\.self){
						Text($0)
					}
				}
				Picker("How do you want to Pay?",  selection: $paymentType) {
					ForEach(paymentTypes, id:\.self){
						Text($0)
						
					}
				}
				Toggle("Add Dine loyalty Card", isOn: $addLoyaltyPoints.animation())
				if addLoyaltyPoints {
					TextField("Enter your loaylty Card",text: $loyaltyPoints)
				}

			}
			
			Section("Add a tip?"){
				Picker("Percentage: ",selection: $tipAmount){
					ForEach(tipAmounts,id:\.self) {
						Text("\($0)%")
					}
				}.pickerStyle(.segmented)
				
			}
			
			Section("Total: \(totalPrice)") {
				Button("Confirm order") {
						// place the order
					showPaymentAlert.toggle()
				}
			}
		}
		.alert("Order Confirmed", isPresented: $showPaymentAlert, actions: {
			
		}, message: {
			Text("Your total was \(totalPrice) - Thank you")
		})
		
		.navigationTitle("Payment")
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	CheckoutView().environmentObject(Order())
}
