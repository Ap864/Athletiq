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
            "dark_mode": "Dark Mode",
            "welcome": "Welcome to Athletiq",
            "start_quiz": "Start Quiz",
            "shop": "Shop",
            "leaderboard": "Leaderboard",
            "time": "Time",
            "final_score": "Final Score",
            "coins": "Coins",
            "coins_earned": "Coins Earned",
            "powerups": "Power-Ups",
            "name_colors": "Name Colors",
            
            "account_settings": "Account Settings",
            "profile_accounts": "Profile and Accounts",
            "about_help": "About / Help",
            "personalization": "Personalization",
            "language": "Language",
            "appearance": "Appearance",
            
            "tap_photo": "Tap to add photo",
            "name": "Name",
            "username": "Username",
            "phone": "Phone Number",
            "email": "Email",
            
            "top": "Top",
            "my_rank": "My Rank",
            "your_rank": "Your Rank",
            "score": "Score",
            
            "home": "Home",
            "tutorial": "Tutorial",
            "see_top_players": "See Top Players --->",
            "edit_profile": "View & edit your profile --->",
            "buy_rewards": "Buy rewards --->",
            "preferences": "Preferences & more --->",
            
            "easy": "Easy",
            "medium": "Medium",
            "hard": "Hard",
            "num_questions": "Number of Questions",
            
            // Start buttons
            "select_difficulty": "Select Difficulty",
            "start": "Start"
        ],
        
        "es": [
            "settings": "Configuración",
            "profile": "Perfil",
            "dark_mode": "Modo Oscuro",
            "welcome": "Bienvenido a Athletiq",
            "start_quiz": "Comenzar Quiz",
            "shop": "Tienda",
            "leaderboard": "Clasificación",
            "time": "Tiempo",
            "final_score": "Puntuación Final",
            "coins": "Monedas",
            "coins_earned": "Monedas Ganadas",
            "powerups": "Potenciadores",
            "name_colors": "Colores de Nombre",
            
            "account_settings": "Configuración de Cuenta",
            "profile_accounts": "Perfil y Cuentas",
            "about_help": "Acerca de / Ayuda",
            "personalization": "Personalización",
            "language": "Idioma",
            "appearance": "Apariencia",
            
            "tap_photo": "Toca para agregar foto",
            "name": "Nombre",
            "username": "Usuario",
            "phone": "Número de Teléfono",
            "email": "Correo Electrónico",
            
            "top": "Top",
            "my_rank": "Mi Ranking",
            "your_rank": "Tu Ranking",
            "score": "Puntuación",
            
            "home": "Inicio",
            "tutorial": "Tutorial",
            "see_top_players": "Ver mejores jugadores --->",
            "edit_profile": "Ver y editar perfil --->",
            "buy_rewards": "Comprar recompensas --->",
            "preferences": "Preferencias y más --->",
            
            "easy": "Fácil",
            "medium": "Medio",
            "hard": "Difícil",
            "num_questions": "Número de Preguntas",
            
            // Quiz Settings
            "select_difficulty": "Seleccionar Dificultad",
            "start": "Comenzar"
        ],
        
        "fr": [
            "settings": "Paramètres",
            "profile": "Profil",
            "dark_mode": "Mode Sombre",
            "welcome": "Bienvenue sur Athletiq",
            "start_quiz": "Commencer le Quiz",
            "shop": "Boutique",
            "leaderboard": "Classement",
            "time": "Temps",
            "final_score": "Score Final",
            "coins": "Pièces",
            "coins_earned": "Pièces Gagnées",
            "powerups": "Bonus",
            "name_colors": "Couleurs du Nom",
            
            "account_settings": "Paramètres du Compte",
            "profile_accounts": "Profil et Comptes",
            "about_help": "À propos / Aide",
            "personalization": "Personnalisation",
            "language": "Langue",
            "appearance": "Apparence",
            
            "tap_photo": "Appuyez pour ajouter une photo",
            "name": "Nom",
            "username": "Nom d'utilisateur",
            "phone": "Numéro de Téléphone",
            "email": "Email",
            
            "top": "Top",
            "my_rank": "Mon Rang",
            "your_rank": "Votre Rang",
            "score": "Score",
            
            "home": "Accueil",
            "tutorial": "Tutoriel",
            "see_top_players": "Voir les meilleurs joueurs --->",
            "edit_profile": "Voir et modifier le profil --->",
            "buy_rewards": "Acheter des récompenses --->",
            "preferences": "Préférences et plus --->",
            
            "easy": "Facile",
            "medium": "Moyen",
            "hard": "Difficile",
            "num_questions": "Nombre de Questions",
            
            // Quiz
            "select_difficulty": "Choisir la difficulté",
            "start": "Démarrer"
        ]
    ]
    
    return translations[language]?[key]
        ?? translations["en"]?[key]
        ?? key
}
