//
//  ContentView.swift
//  Created by GaliSrikanth on 19/04/24.

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    //var messagesArr = MockMessages.messagesArr
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView(showsIndicators: false) {
                        ForEach(messagesManager.messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageId) { msgId in
                        withAnimation {
                            proxy.scrollTo(msgId, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color.peach)
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

#Preview {
    ContentView()
}
