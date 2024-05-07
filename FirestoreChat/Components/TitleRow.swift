//
//  TitleRow.swift
//  Created by GaliSrikanth on 07/05/24.

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Sarah Smith"
    
    var body: some View {
        HStack(spacing: 20) {
            //ProfilePic
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            //Name & status
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .font(.title)
                    .bold()
                
                Text("Online")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //CallImage
            Image(systemName: "phone.fill")
                .foregroundColor(.iGray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

#Preview {
    TitleRow()
        .background(Color.peach)
}
