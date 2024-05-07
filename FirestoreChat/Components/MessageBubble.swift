//
//  MessageBubble.swift
//  Created by GaliSrikanth on 07/05/24.

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing, spacing: 5) {
            HStack(spacing: 0) {
                Text(message.text)
                    .padding()
                    .background(message.received ? .iGray : .peach)
                    .cornerRadius(30.0)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text(message.timestamp.formatted(.dateTime.hour().minute()))
                    .font(.caption2)
                    .foregroundColor(.iGray)
                    .padding(message.received ? .leading : .trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: MockMessages.message)
}
