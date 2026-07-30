//
//  home_screenApp.swift
//  home screen
//
//  Created by DPI Student 015 on 7/18/26.
//

import SwiftUI

//Main Tab Bar

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
                
            case 0:
                HomeFeedView()
                
            case 1:
                DiscoverView()
                
            case 2:
                NewPostView()
                
            case 3:
                InboxView()
                
            case 4:
                ProfileView()
                
            default:
                HomeFeedView()
            }
            VStack {
                Spacer()
                HStack {
                    
                    Button {
                        selectedTab = 0
                    } label: {
                        Image(systemName: "house.fill")
                            .foregroundColor(selectedTab == 0 ? .red : .white)
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(selectedTab == 1 ? .red : .white)
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = 2
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = 3
                    } label: {
                        Image(systemName: "message.fill")
                            .foregroundColor(selectedTab == 3 ? .red : .white)
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = 4
                    } label: {
                        Image(systemName: "person.fill")
                            .foregroundColor(selectedTab == 4 ? .red : .white)
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.85))
            }
        }
    }
    
    //Home
    
    struct HomeFeedView: View {
        var body: some View {
            ZStack {
                AppBackground()
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        VStack(spacing: 8) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                            Text("Welcome to the main center")
                                .font(.custom("Silkscreen-Bold", size: 25))
                                .bold()
                                .foregroundColor(.white)
                            Text("Explore the home screen of the app")
                                .font(.custom("Pixelbasel", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                        }
                        .padding(.top, 40)
                        
                        NavigationLink(destination: SettingsView()) {
                            MenuButtonLabel(icon: "gearshape.fill", label: "Settings", colors: [Color.purple, Color.blue])
                            
                        }
                        
                        NavigationLink(destination: FavoritesView()) {
                            MenuButtonLabel(icon: "gift.fill", label: "Favorite console modifying videos", colors: [Color.orange, Color.red])
                        }
                        
                        NavigationLink(destination: AboutView()) {
                            MenuButtonLabel(icon: "info.circle.fill", label: "About this app", colors: [Color.green, Color.teal])
                        }
                        
                        Spacer().frame(height: 80)
                    }
                    .padding()
                }
            }
        }
    }
    
    struct MenuButtonLabel: View {
        var icon: String
        var label: String
        var colors: [Color]
        
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Text(label)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
            .cornerRadius(16)
        }
    }
    
    //Settings
    
    struct SettingsToggleRow: View {
        var icon: String
        var label: String
        @Binding var isOn: Bool
        
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .frame(width: 26)
                Text(label)
                    .foregroundColor(.white)
                Spacer()
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .tint(.red)
            }
            .padding(.vertical, 10)
        }
    }
    
    struct SettingsView: View {
        @State var pushNotifications = true
        @State var darkMode = true
        @State var autoplayVideos = false
        @State var cameraAccess = true
        @State var microphoneAccess = false
        @State var locationServices = false
        
        var body: some View {
            ZStack {
                AppBackground()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("PREFERENCES")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            VStack(spacing: 0) {
                                SettingsToggleRow(icon: "bell.fill", label: "Push Notifications", isOn: $pushNotifications)
                                Divider().background(Color.white.opacity(0.2))
                                SettingsToggleRow(icon: "moon.fill", label: "Dark Mode", isOn: $darkMode)
                                Divider().background(Color.white.opacity(0.2))
                                SettingsToggleRow(icon: "play.circle.fill", label: "Autoplay Videos", isOn: $autoplayVideos)
                            }
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(14)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("PRIVACY")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            VStack(spacing: 0) {
                                SettingsToggleRow(icon: "camera.fill", label: "Allow Camera Access", isOn: $cameraAccess)
                                Divider().background(Color.white.opacity(0.2))
                                SettingsToggleRow(icon: "mic.fill", label: "Allow Microphone Access", isOn: $microphoneAccess)
                                Divider().background(Color.white.opacity(0.2))
                                SettingsToggleRow(icon: "location.fill", label: "Location Services", isOn: $locationServices)
                            }
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(14)
                        }
                        
                        Spacer().frame(height: 40)
                    }
                    .padding()
                }
            }
            .navigationTitle("Settings")
        }
    }
}
    
