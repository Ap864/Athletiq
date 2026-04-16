//
//  LanguageHelper.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

func localized(_ key: String, language: String) -> String {
    
    let translations: [String: [String: String]] = [
        "en": [
            "settings": "Settings",
            "profile": "Profile",
            "dark_mode": "Dark Mode"
        ],
        "es": [
            "settings": "Configuración",
            "profile": "Perfil",
            "dark_mode": "Modo Oscuro"
        ],
        "fr": [
            "settings": "Paramètres",
            "profile": "Profil",
            "dark_mode": "Mode Sombre"
        ]
    ]
    
    return translations[language]?[key] ?? key
}
