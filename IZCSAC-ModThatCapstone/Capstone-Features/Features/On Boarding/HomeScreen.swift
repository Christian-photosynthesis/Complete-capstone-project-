//
//  HomeScreen.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/25/26.
//

import SwiftUI


// Home screen
struct HomeScreen: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack() {
                Image("back2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    Image("2")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 16)
                        .frame(width: 120)
                        .shadow(radius:10)
                    
                    Text("Login")
                        .font(.custom("Silkscreen-Bold", size: 27))
                        .foregroundColor(Color.white)
                        .fontWeight(.heavy)
                        .padding([.bottom], 30)
                    
                           
                            // put info here
                            TextField("Email", text: self.$email)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 320)
                                .cornerRadius(20)
                            SecureField("Password", text:self.$password)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 320)
                                .cornerRadius(20)
                            
                            
                            // moving to user's home page
                            NavigationLink(destination: MainTabView()) {
                                Text("Sign In").font(.custom("Silkscreen-Bold", size: 27)).font(.headline).foregroundColor(.white).padding().frame(width: 300, height: 50).background(Color.red).cornerRadius(15)
                                
                            }
                            Button(action: {}) {
                                Text("Don't have an account? Register here")
                                    .font(.custom("Pixelbasel", size: 20))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                            }
                            .padding(.horizontal, 30)
                        }
                        
                    }
        }
    }
}
         
