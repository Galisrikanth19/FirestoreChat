//
//  MessageField.swift
//  Created by GaliSrikanth on 07/05/24.

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    
    var body: some View {
        HStack(spacing: 0) {
            CustomTextField(placeholder: Text("Enter your message here..."),
                            text: $message)
            
            Button {
                messagesManager.sendMessage(message)
                print("message sent")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.peach)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.iGray)
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessagesManager())
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    
    var editingChanged: (Bool)->() = {_ in}
    var commint: ()->() = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.3)
            }
            
            TextField("",
                      text: $text,
                      onEditingChanged: editingChanged,
                      onCommit: commint)
        }
    }
}
