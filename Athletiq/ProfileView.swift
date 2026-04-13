//
//  ProfileView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: UIImage? = nil
    
    // 🔥 User input states
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            
            // Profile Image Picker
            PhotosPicker(selection: $selectedItem, matching: .images) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.5))
                        .frame(width: 225, height: 225)
                        .cornerRadius(15)
                    
                    if let image = profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 225, height: 225)
                            .clipped()
                            .cornerRadius(15)
                    } else {
                        VStack {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                            
                            Text("Tap to add photo")
                                .foregroundColor(.white)
                                .font(.custom("Inter", size: 16))
                        }
                    }
                }
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        profileImage = uiImage
                    }
                }
            }
            .padding(.top, 40)
            
            // 🔥 Editable Fields
            VStack(spacing: 20) {
                
                TextField("Name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Phone Number", text: $phone)
                    .keyboardType(.phonePad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
            }
            .padding()
            .font(.custom("Inter", size: 18))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.81, green: 0.81, blue: 0.81))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
