//
//  ActivityOverview.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//

//
//  ActivityOverview.swift
//  Projektwoche1
//
//  Created by Joanna Kühn on 18.09.24.
//

import SwiftUI
import SwiftData

struct ActivityOverview: View {
    
    
    @Environment(\.modelContext) var context
    @State var pet : Pet
    
    @State private var activities: [Activity] = [
        Activity(name: "Sleep",activityDescription: "Sleeping description", date: Date(), type: .sleep, duration: 30.0, isDone: false),
        Activity(name: "Training",activityDescription: "Training description", date: Date(), type: .training, duration: 30.0, isDone: false),
        Activity(name: "Walking",activityDescription: "Walking description", date: Date(), type: .walks, duration: 30.0, isDone: false),
        Activity(name: "Playtime",activityDescription: "Playtime description", date: Date(), type: .walks, duration: 30.0, isDone: false),
        Activity(name: "Training2",activityDescription: "Training description", date: Date(), type: .training, duration: 30.0, isDone: false),
        Activity(name: "Walking2",activityDescription: "Walking description", date: Date(), type: .walks, duration: 30.0, isDone: false),
        Activity(name: "Playtime2",activityDescription: "Playtime description", date: Date(), type: .walks, duration: 30.0, isDone: false)
    ]
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
        var body: some View{
            
            VStack(spacing: 20) {
                Text("Activities")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                HStack(spacing: 20) {
                    // Walks duration
                    VStack {
                        Text("Walks").font(.headline)
                        Text(countDuration(activities: activities.filter { $0.type == .walks }))
                            .font(.caption)
                    }
                    // Sleep duration
                    VStack {
                        Text("Sleep").font(.headline)
                        Text(countDuration(activities: activities.filter { $0.type == .sleep }))
                            .font(.caption)
                    }
                    // Training duration
                    VStack {
                        Text("Training").font(.headline)
                        Text(countDuration(activities: activities.filter { $0.type == .training }))
                            .font(.caption)
                    }
                    // Playtime duration
                    VStack {
                        Text("Playtime").font(.headline)
                        Text(countDuration(activities: activities.filter { $0.type == .playtime }))
                            .font(.caption)
                    }
                }
                .frame(width: 350, height: 100)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                
           
                NavigationStack {
        
                
                    LazyVGrid(columns: columns) {
                                ForEach(ActivityType.allCases) { activityType in
                                    let filteredActivities = activities.filter { $0.type == activityType }
                                    
                                    NavigationLink(destination: ActivityDetailsView(activities: filteredActivities)) {
                                        BoxItem(title: activityType.rawValue.capitalized)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                }
            }
            .padding()
        }
   
    }
func countDuration(activities: [Activity]) -> String {

    var totalDuration: Double = 0.0
    // Summing the durations of all activities
    for activity in activities {
        totalDuration += activity.duration
    }
    // Return the total as a string, optionally formatted with no decimal places
    return String(format: "%.0f", totalDuration) + " minutes"
}


#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    container.mainContext.insert(
        Pet(name: "Tiny",
            type: .dog,
            isChipped: false,
            birthDate: Date(),
            color: "String",
            weight: 0.0,
            size: .big,
            breed: ".corgi",
            
            petsVet: Vet(fullName: "Joanna", assignedPets: [], appointments: []),
            medicalRecord: MedicalRecord(allergies: [], medications: [], appointments: [], vaccinations: []),
            activities: [Activity(name: "some", activityDescription: "descriprion", date: Date(), type: .playtime, duration: 30.0, isDone: false)],
            owner: PetOwner(name: "oetsowber", surName: "name", ownedPets: [])
           )
    )
    return ActivityOverview(pet: Pet(name: "String",
                                     type: .dog,
                                     isChipped: false,
                                     birthDate: Date(),
                                     color: "String",
                                     weight: 0.0,
                                     size: .big,
                                     breed: ".corgi",
                                     petsVet: Vet(fullName: "Lisis", assignedPets: [], appointments: []),
                                                         activities: [Activity(name: "some", activityDescription: "descriprion", date: Date(), type: .playtime, duration: 30.0, isDone: false)],
                                     owner: PetOwner(name: "oetsowber", surName: "name", ownedPets: [])))
    .modelContainer(container)
}
