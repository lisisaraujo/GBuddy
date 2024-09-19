//
//  BoxItem.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//

//
//  BoxItem.swift
//  Projektwoche1
//
//  Created by Joanna Kühn on 18.09.24.
//

import SwiftUI

struct BoxItem: View {
    
    var title: String = "title"
         var listOfItems: [String] = ["2"]
         var iconName: String = "pawprint"
    var body: some View {
        VStack{
                    VStack{
                        Text(title)
                            .padding(.vertical)

                        Image(systemName: "pawprint")

                    }        .padding()

                }
                .frame(width: 150, height: 150)
                .background(
                    Rectangle()
                        .fill(.clear)
                        .border(Color.black)
                        .cornerRadius(10.0)
                        .shadow(radius: 2))
    }
}

#Preview {
    BoxItem()
}
