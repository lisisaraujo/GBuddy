//
//  HealthItemView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI

struct HealthItemView: View {
    
    var title: String
    var listOfItems: [String]
    var iconName: String
    
    var body: some View {
        VStack{
            VStack{
                Text("\(title) (\(listOfItems.isEmpty ? "None" : String(listOfItems.count)))")
                    .padding(.vertical)
                
                Image(systemName: iconName)
                
            }        .padding()
            
        }
        .frame(width: 150, height: 150)
        .background(
            Rectangle()
                .fill(.clear)
                .border(Color.black)
                .cornerRadius(10.0)
                .shadow(radius: 2)
        )
    }
}

#Preview {
    HealthItemView(title: "Title", listOfItems: ["1", "2"], iconName: "pawprint")
}
