//
//  ResourceLink.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/28/26.
//

import SwiftUI

    //Favorite
    
    struct ResourceLink: Identifiable {
        let id = UUID()
        var title: String
        var urlString: String
    }
    
    struct ResourceSection: Identifiable {
        let id = UUID()
        var heading: String
        var links: [ResourceLink]
    }
    
    struct ResourceRow: View {
        var icon: String
        var title: String
        var urlString: String
        
        var body: some View {
            if let url = URL(string: urlString) {
                Link(destination: url) {
                    HStack {
                        Image(systemName: icon)
                            .foregroundColor(.white)
                            .frame(width: 24)
                        Text(title)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Image(systemName: "arrow.up.right.square")
                            .foregroundColor(.white.opacity(0.6))
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(12)
                }
            }
        }
    }
    
    struct FavoritesView: View {
        let videoLinks: [ResourceLink] = [
            ResourceLink(title: "Dreamcast modding video", urlString: "https://www.youtube.com/watch?v=Gsl7rOAUM3Q"),
            ResourceLink(title: "Modding Xbox 360 (Part 1)", urlString: "https://www.youtube.com/watch?v=z7Fbi8zN8tw"),
            ResourceLink(title: "Modding Xbox 360 (Part 2)", urlString: "https://www.youtube.com/watch?v=aZpCGGop55M"),
            ResourceLink(title: "Modding original Xbox", urlString: "https://www.youtube.com/watch?v=NchZ-mHqTb0"),
            ResourceLink(title: "Modding Xbox One", urlString: "https://www.youtube.com/watch?v=i45-gvbdgCU"),
            ResourceLink(title: "Modding Meta Quest 3 to play GTA V", urlString: "https://www.youtube.com/watch?v=BQeBtiDvylY"),
            ResourceLink(title: "Creating the profile page", urlString: "https://www.youtube.com/watch?v=MDs8DibSlgg")
        ]
        
        let platformSections: [ResourceSection] = [
            ResourceSection(heading: "Xbox", links: [
                ResourceLink(title: "Aurora for Xbox 360", urlString: "https://phoenix.xboxunity.net/#/news"),
                ResourceLink(title: "Xbox 360 Neighborhood", urlString: "https://consolemods.org/wiki/Xbox_360:Xbox_360_Neighborhood")
            ]),
            ResourceSection(heading: "Sony", links: [
                ResourceLink(title: "PS1 Mods Wiki", urlString: "https://consolemods.org/wiki/PS1:PS1_Mods_Wiki")
            ]),
            ResourceSection(heading: "Nintendo", links: [
                ResourceLink(title: "Homebrew for DS, Wii, Game Boy, etc.", urlString: "https://brew.sh/")
            ]),
            ResourceSection(heading: "Other Companies", links: [
                ResourceLink(title: "Meta Quest modding wiki", urlString: "https://bsmg.wiki/quest-modding.html"),
                ResourceLink(title: "SideQuest setup guide", urlString: "https://sidequestvr.com/setup-howto")
            ]),
            ResourceSection(heading: "General Resources", links: [
                ResourceLink(title: "iFixit tech tutorials", urlString: "https://www.ifixit.com"),
                ResourceLink(title: "Tinker-MOD (old consoles)", urlString: "https://www.Tinker-MOD.com"),
                ResourceLink(title: "ConsoleMods.org (software)", urlString: "https://consolemods.org"),
                ResourceLink(title: "GDMENUCardManager (GitHub)", urlString: "https://github.com/sonik-br/GDMENUCardManager/releases"),
                ResourceLink(title: "GDEMU details", urlString: "https://gdemu.wordpress.com/details/gdemu-details/")
            ])
        ]
        
        var body: some View {
            ZStack {
                AppBackground()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        Text("Favorites")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("VIDEOS")
                                .font(.caption)
                                .foregroundColor(.gray)
                            ForEach(videoLinks) { video in
                                ResourceRow(icon: "play.circle.fill", title: video.title, urlString: video.urlString)
                            }
                        }
                        
                        ForEach(platformSections) { section in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(section.heading.uppercased())
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                ForEach(section.links) { link in
                                    ResourceRow(icon: "link", title: link.title, urlString: link.urlString)
                                }
                            }
                        }
                        
                        Spacer().frame(height: 40)
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
        }
    }
