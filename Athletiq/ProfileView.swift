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
    
    //  image saving
    @AppStorage("profileImageData") private var profileImageData: Data = Data()
    
    //  saves
    @AppStorage("name") private var name: String = ""
    @AppStorage("username") private var username: String = ""
    @AppStorage("phone") private var phone: String = ""
    @AppStorage("email") private var email: String = ""
    
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        VStack {
            
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
                            
                            Text(localized("tap_photo", language: appLanguage))
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
                        
                        //  SAVE IMAGE
                        if let jpegData = uiImage.jpegData(compressionQuality: 0.8) {
                            profileImageData = jpegData
                        }
                    }
                }
            }
            .onAppear {
                //  LOAD IMAGE
                if let savedImage = UIImage(data: profileImageData) {
                    profileImage = savedImage
                }
            }
            .padding(.top, 40)
            
            VStack(spacing: 20) {
                
                TextField(localized("name", language: appLanguage), text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField(localized("username", language: appLanguage), text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField(localized("phone", language: appLanguage), text: $phone)
                    .keyboardType(.phonePad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField(localized("email", language: appLanguage), text: $email)
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
