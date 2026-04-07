//
//  ShopView.swift
//  Athletiq
//
//  Created by 64005540 on 4/13/26.
//

import SwiftUI

struct ShopView: View {
    
    //  GLOBAL STORAGE
    @AppStorage("coins") var coins = 0
    @AppStorage("hasExtraTime") var hasExtraTime = false
    @AppStorage("hasDoubleCoins") var hasDoubleCoins = false
    @AppStorage("hasFiftyFifty") var hasFiftyFifty = false
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    
    var body: some View {
        VStack(spacing: 20) {
            
            //  TOP BAR
            HStack {
                Text(username)
                    .foregroundColor(getNameColor())
                    .font(.headline)
                
                Spacer()
                
                Text("🪙 \(coins)")
                    .font(.headline)
            }
            .padding()
            
            Text("Shop")
                .font(.largeTitle)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    //  POWERUPS
                    Text("Power-Ups")
                        .font(.title2)
                    
                    shopButton(
                        title: "+5 Seconds (Permanent)",
                        price: 150,
                        owned: hasExtraTime
                    ) {
                        if coins >= 150 && !hasExtraTime {
                            coins -= 150
                            hasExtraTime = true
                        }
                    }
                    
                    shopButton(
                        title: "Double Coins Boost (1 Use)",
                        price: 200,
                        owned: false
                    ) {
                        if coins >= 200 {
                            coins -= 200
                            hasDoubleCoins = true
                        }
                    }
                    
                    shopButton(
                        title: "50/50 Hint (1 Use)",
                        price: 75,
                        owned: false
                    ) {
                        if coins >= 75 {
                            coins -= 75
                            hasFiftyFifty = true
                        }
                    }
                    
                    //  COSMETICS
                    Text("Name Colors")
                        .font(.title2)
                        .padding(.top)
                    
                    shopButton(
                        title: "Red Name",
                        price: 100,
                        owned: nameColor == "red"
                    ) {
                        if coins >= 100 {
                            coins -= 100
                            nameColor = "red"
                        }
                    }
                    
                    shopButton(
                        title: "Blue Name",
                        price: 100,
                        owned: nameColor == "blue"
                    ) {
                        if coins >= 100 {
                            coins -= 100
                            nameColor = "blue"
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    //  BUTTON COMPONENT
    func shopButton(title: String, price: Int, owned: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Text(owned ? "Owned" : "\(price)")
            }
            .padding()
            .background(owned ? Color.green : Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .disabled(owned)
    }
    
    //  COLOR FUNCTION
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
}
