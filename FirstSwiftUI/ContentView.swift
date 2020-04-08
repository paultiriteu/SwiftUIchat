//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by Paul Tiriteu on 18/03/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import SwiftUI

struct ChatMessage: Hashable {
    var message: String
    var avatar: String
    var color: Color
    var isMe = false
}

struct ContentView: View {
    @State var composedMessage = ""
    @EnvironmentObject var chatController: ChatController
        
    var body: some View {
        VStack {
            List {
                ForEach(chatController.messages, id: \.self) { message in
                    ChatRow(chatMessage: message)
                }
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            
            HStack {
                TextField("Message...", text: $composedMessage)
                Button(action: sendMessage) {
                    Text("Send")
                }.padding()
            }
        }
    }
    
    func sendMessage() {
        let message = ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true)
        chatController.sendMessage(message)
        composedMessage = ""
    }
}

struct ChatRow: View {
    var chatMessage: ChatMessage
    
    var body: some View {
        Group {
            if chatMessage.isMe {
                Group {
                    HStack {
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(.white)
                            .padding(10)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                        Text(chatMessage.avatar)
                    }
                }
            } else {
                HStack {
                    Group {
                        Text(chatMessage.avatar)
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(.white)
                            .padding(10)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ChatController())
    }
}
#endif
