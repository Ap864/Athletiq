//
//  ShopItem.swift
//  Athletiq
//
//  Created by 64005540 on 4/17/26.
//

import Foundation

struct ShopItem: Identifiable {
    let id: String
    let name: String
    let price: Int
}
let shopItems = [
    ShopItem(id: "hint", name: "50/50 Hint", price: 50),
    ShopItem(id: "skip", name: "Skip Question", price: 75),
    ShopItem(id: "time", name: "+5 Seconds", price: 100),
    ShopItem(id: "theme", name: "Dark Theme", price: 150)
]
