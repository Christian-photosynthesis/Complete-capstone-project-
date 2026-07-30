//
//  AboutView.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/28/26.
//

import SwiftUI

// About this app
    
    struct AboutView: View {
        var body: some View {
            ZStack {
                AppBackground()
                VStack(spacing: 16) {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text("About")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Text("A community for console modding enthusiasts to share tips and discoveries.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
            }
            .navigationTitle("About")
        }
    }
