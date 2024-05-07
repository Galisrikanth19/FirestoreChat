//
//  MessageModel.swift
//  Created by GaliSrikanth on 07/05/24.

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

struct MockMessages {
    static let message = Message(id: "12345",
                                 text: "This is sample message from the swiftui and iam enjoying the coding.",
                                 received: true,
                                 timestamp: Date())
    
    static let messagesArr = [Message(id: "1",
                                     text: "Hello",
                                     received: true,
                                     timestamp: Date()),
                              Message(id: "12",
                                      text: "How are you doing...",
                                      received: true,
                                      timestamp: Date()),
                              Message(id: "123",
                                      text: "This is sample message from the swiftui and iam enjoying the coding.",
                                      received: true,
                                      timestamp: Date())
    ]
}
