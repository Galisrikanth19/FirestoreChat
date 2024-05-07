//
//  MessagesManager.swift
//  Created by GaliSrikanth on 07/05/24.

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    let firestoreDB = Firestore.firestore()
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId: String = ""
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        firestoreDB.collection("messages").addSnapshotListener { querySnapshot, err in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents \(err?.localizedDescription ?? "")")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("error while parsing documents \(error.localizedDescription)")
                    return nil
                }
            }
            
            self.messages.sort { message1, message2 in
                message1.timestamp < message2.timestamp
            }
            
            if let msgId = self.messages.last?.id {
                self.lastMessageId = msgId
            }
        }
    }
    
    func sendMessage(_ messageStr: String) {
        do {
            let newMessage = Message(id: "\(UUID())",
                                     text: messageStr,
                                     received: false,
                                     timestamp: Date())
            try firestoreDB.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error while sending the message \(error.localizedDescription)")
        }
    }
}
