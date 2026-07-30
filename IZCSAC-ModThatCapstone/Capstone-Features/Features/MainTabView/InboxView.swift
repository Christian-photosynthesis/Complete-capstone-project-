import SwiftUI

//Inbox

struct InboxMessage: Identifiable {
    let id = UUID()
    var username: String
    var preview: String
    var time: String
}

struct InboxView: View {
    let messages: [InboxMessage] = [
        InboxMessage(username: "modqueen_ash", preview: "hey does that fix work on the older model too?", time: "2h"),
        InboxMessage(username: "retrofix_dave", preview: "sent you the link, lmk if it helps", time: "1d"),
        InboxMessage(username: "sadgamer22", preview: "replied to your comment", time: "3d")
    ]

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(spacing: 0) {
                    ForEach(messages) { message in
                        HStack(spacing: 12) {
                            Circle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: 46, height: 46)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.white)
                                )

                            VStack(alignment: .leading, spacing: 2) {
                                Text(message.username)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(message.preview)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    .lineLimit(1)
                            }

                            Spacer()

                            Text(message.time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .padding()

                        Divider().background(Color.white.opacity(0.15))
                    }
                }
                .padding(.top, 8)
            }
        }
        .navigationTitle("Inbox")
    }
}
