import SwiftUI

struct ContentView: View {
    
    @AppStorage("coins") var coins = 0
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // 🌈 Background Gradient
                LinearGradient(
                    colors: [Color.blue.opacity(0.2), Color.white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    
                    // 🔝 Top Bar
                    HStack {
                        Text(username)
                            .foregroundColor(getNameColor())
                            .font(.title3.bold())
                        
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Text("🪙")
                            Text("\(coins)")
                        }
                        .font(.headline)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // 🏷 Header
                    Text("Athletiq")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    // ▶️ Start Quiz Button
                    NavigationLink(destination: StartQuizView()) {
                        Text("Start Quiz")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // 🧩 Grid Options
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        
                        NavigationLink(destination: LeaderboardView()) {
                            ModernCard(title: "Leaderboard", icon: "trophy.fill")
                        }
                        
                        NavigationLink(destination: ProfileView()) {
                            ModernCard(title: "Profile", icon: "person.fill")
                        }
                        
                        NavigationLink(destination: ShopView()) {
                            ModernCard(title: "Shop", icon: "cart.fill")
                        }
                        
                        NavigationLink(destination: SettingsView()) {
                            ModernCard(title: "Settings", icon: "gearshape.fill")
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // ❓ Tutorial
                    NavigationLink(destination: TutorialView()) {
                        Text("Tutorial")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    // 📱 Bottom Nav
                    HStack {
                        BottomTab(title: "Home", icon: "house.fill")
                        BottomTab(title: "Profile", icon: "person.fill")
                        BottomTab(title: "Shop", icon: "cart.fill")
                        BottomTab(title: "Settings", icon: "gearshape.fill")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
            }
        }
    }
    
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
}


// Reusable card (UNCHANGED)
struct ModernCard: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}
struct BottomTab: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
