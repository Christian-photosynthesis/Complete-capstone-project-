//
//  ProfileView.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/28/26.
//

import SwiftUI


// Profile
struct ProfileView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    let photoNames = ["Image 1", "Image 2", "Image 3"]

    @State var showPhoto = false
    @State var selectedPhotoName = ""

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(spacing: 16) {

                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 90, height: 90)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                        )
                        .padding(.top, 20)

                    Text("username")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Text("No bio yet")
                        .foregroundColor(.gray)

                    HStack(spacing: 40) {
                        VStack {
                            Text("\(photoNames.count)").bold().foregroundColor(.white)
                            Text("Posts").font(.caption).foregroundColor(.gray)
                        }
                        VStack {
                            Text("0").bold().foregroundColor(.white)
                            Text("Followers").font(.caption).foregroundColor(.gray)
                        }
                        VStack {
                            Text("0").bold().foregroundColor(.white)
                            Text("Following").font(.caption).foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 8)

                    Divider()
                        .background(Color.white.opacity(0.2))
                        .padding(.top, 12)

                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(photoNames, id: \.self) { name in
                            Image(name)
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .clipped()
                                .onTapGesture {
                                    selectedPhotoName = name
                                    showPhoto = true
                                }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showPhoto) {
            PhotoDetailView(imageName: selectedPhotoName)
        }
    }
}
