//
//  ChatController.swift
//  FirstSwiftUI
//
//  Created by Paul Tiriteu on 21/03/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Combine
import SwiftUI

class ChatController: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var messages = [
        ChatMessage(message: "Hello everyone", avatar: "A", color: .red),
        ChatMessage(message: "O boy", avatar: "B", color: .blue)
    ]
    
    func sendMessage(_ message: ChatMessage) {
        messages.append(message)
        didChange.send()
    }
}
