import SwiftUI
//New Post

struct NewPostView: View {
    @State var postText = ""

    var body: some View {
        ZStack {
            AppBackground()

            VStack(alignment: .leading, spacing: 16) {

                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 44, height: 44)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                        )
                    Text("username")
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }

                ZStack(alignment: .topLeading) {
                    if postText.isEmpty {
                        Text("What did you modify today?")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 4)
                    }
                    TextEditor(text: $postText)
                        .scrollContentBackground(.hidden)
                        .foregroundColor(.white)
                        .frame(height: 150)
                }

                Divider().background(Color.white.opacity(0.2))

                HStack(spacing: 24) {
                    Image(systemName: "photo.on.rectangle")
                        .foregroundColor(.white.opacity(0.8))
                    Image(systemName: "video.fill")
                        .foregroundColor(.white.opacity(0.8))
                    Image(systemName: "chart.bar.fill")
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                }

                Spacer()

                Button(action: {
                    // posting not functional yet
                }) {
                    Text("Post")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("New Post")
    }
}
