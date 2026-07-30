//
//  PhotoDetailView.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/28/26.
//

import SwiftUI

 struct PhotoDetailView: View {
    var imageName: String
    
    @State var isLiked = false
    @State var likeCount = Int.random(in: 4...58)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            HStack(spacing: 30) {
                Button(action: {
                    isLiked.toggle()
                    likeCount += isLiked ? 1 : -1
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 26))
                            .foregroundColor(isLiked ? .red : .white)
                        Text("\(likeCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
                
                VStack(spacing: 4) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                    Text("Share")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding()
            .padding(.bottom, 30)
        }
    }
}
