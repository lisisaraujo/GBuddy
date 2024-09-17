//
//  MedicalRecordSheetView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI

struct MedicalRecordSheetView: View {
    var title: String
    var content: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding()
                
                ScrollView {
                    Text(content)
                        .padding()
                }
                
                Spacer()
            }
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
    }
}
#Preview {
    MedicalRecordSheetView(title: "Title", content: "List of items")
}
