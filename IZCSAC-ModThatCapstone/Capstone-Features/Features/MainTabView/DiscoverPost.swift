//
//  DiscoverPost.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/28/26.
//

import SwiftUI

    // MARK: - Discover (FYP-style feed with search)
    
    struct DiscoverPost: Identifiable {
        let id = UUID()
        var username: String
        var text: String
        var linkURL: String? = nil
    }
    
    struct DiscoverView: View {
        @State var searchText = ""
        
        let allPosts: [DiscoverPost] = [
            DiscoverPost(username: "modqueen_ash", text: "Finally got my shell swap looking clean, took way longer than expected lol"),
            DiscoverPost(username: "retrofix_dave", text: "PSA: double check your screws before reassembly, learned that the hard way"),
            DiscoverPost(username: "macho_nacho_fan", text: "This tools breakdown is the best one I've seen for modding retro consoles, watch this", linkURL: "https://youtu.be/i4PfUoxWaZA"),
            DiscoverPost(username: "console_lover22", text: "Found this video, thought it was worth sharing here", linkURL: "https://youtu.be/Np52UQzwyOQ")
        ]
        
        var filteredPosts: [DiscoverPost] {
            if searchText.isEmpty {
                return allPosts
            } else {
                return allPosts.filter { post in
                    post.username.lowercased().contains(searchText.lowercased()) ||
                    post.text.lowercased().contains(searchText.lowercased())
                }
            }
        }
        
        var body: some View {
            ZStack {
                AppBackground()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Discover")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search users or posts", text: $searchText)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        
                        ForEach(filteredPosts) { post in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(alignment: .top, spacing: 12) {
                                    Circle()
                                        .fill(Color.gray.opacity(0.4))
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            Image(systemName: "person.fill")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        )
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(post.username)
                                            .font(.caption)
                                            .bold()
                                            .foregroundColor(.white.opacity(0.8))
                                        Text(post.text)
                                            .font(.body)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                if let linkString = post.linkURL, let url = URL(string: linkString) {
                                    Link(destination: url) {
                                        HStack {
                                            Image(systemName: "play.circle.fill")
                                            Text("Watch video")
                                            Spacer()
                                            Image(systemName: "arrow.up.right.square")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.white.opacity(0.15))
                                        .cornerRadius(8)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        if filteredPosts.isEmpty {
                            Text("No results found")
                                .foregroundColor(.gray)
                                .padding(.top, 20)
                        }
                    }
                    .padding()
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Discover")
        }
    }
