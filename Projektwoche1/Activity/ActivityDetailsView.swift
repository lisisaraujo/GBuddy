//
//  ActivityDetailsView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//

//
//  ActivityDetailsView.swift
//  Projektwoche1
//
//  Created by Joanna Kühn on 18.09.24.
//

import SwiftUI
import SwiftData

struct ActivityDetailsView: View {
    
    @Environment(\.modelContext) var context
    var activities: [Activity] = [
        Activity(name: "Sleep",activityDescription: "Sleeping description", date: Date(), type: .sleep, duration: 30.0, isDone: false),
        Activity(name: "Training",activityDescription: "Training description", date: Date(), type: .training, duration: 30.0, isDone: false),
        Activity(name: "Walking",activityDescription: "Walking description", date: Date(), type: .walks, duration: 30.0, isDone: false),
        Activity(name: "Playtime",activityDescription: "Playtime description", date: Date(), type: .walks, duration: 30.0, isDone: false)
    ]
    var body: some View {
        Text("pet.name")
      
        // Print filtered activities
        ForEach(activities) { activity in
            Text("\(activity.name) - Type: \(activity.type.rawValue)")
        }
    }
}

#Preview {
    
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
 
    return ActivityDetailsView(activities: [Activity(name: "some", activityDescription: "descriprion", date: Date(), type: .playtime, duration: 30.0, isDone: false)]).modelContainer(container)
}
