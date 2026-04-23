//
//  ShopView.swift
//  Athletiq
//
//  Created by 64005540 on 4/13/26.
//

import SwiftUI

struct ShopView: View {
    
    @AppStorage("coins") var coins = 0
    @AppStorage("hasExtraTime") var hasExtraTime = false
    @AppStorage("hasFiftyFifty") var hasFiftyFifty = false
    @AppStorage("hasRevealAnswer") var hasRevealAnswer = false //
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text(username)
                    .foregroundColor(getNameColor())
                    .font(.headline)
                
                Spacer()
                
                Text("🪙 \(coins)")
                    .font(.headline)
            }
            .padding()
            
            Text(localized("shop", language: appLanguage))
                .font(.largeTitle)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text(localized("powerups", language: appLanguage))
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
                        title: "50/50 Hint (1 Use)",
                        price: 75,
                        owned: hasFiftyFifty
                    ) {
                        if coins >= 75 && !hasFiftyFifty {
                            coins -= 75
                            hasFiftyFifty = true
                        }
                    }
                    
                    //  NEW POWERUP
                    shopButton(
                        title: "Reveal Correct Answer (1 Use)",
                        price: 500,
                        owned: hasRevealAnswer
                    ) {
                        if coins >= 500 && !hasRevealAnswer {
                            coins -= 500
                            hasRevealAnswer = true
                        }
                    }
                    
                    Text(localized("name_colors", language: appLanguage))
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
    
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
}
