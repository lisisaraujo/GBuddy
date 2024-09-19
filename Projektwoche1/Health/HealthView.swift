//
//  HealthView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI
import SwiftData

struct HealthView: View {
    
    @Environment(\.modelContext) var context
    
    @State var pet: Pet
    
    // enum to represent the different sheets
    enum ActiveSheet: String, Identifiable {
        case allergies
        case medications
        case appointments
        case vaccinations
        
        var id: String {
            return self.rawValue
        }
    }
    
    @State private var presentedSheet: ActiveSheet?
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // grid with 2 coloumns
                    let columns = [
                        GridItem(.flexible(), spacing: -10),
                        GridItem(.flexible())
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        Button(action: {
                            presentedSheet = .allergies // set the active sheet to allergies
                        }) {
                            HealthItemView(title: "Allergies", listOfItems: pet.medicalRecord.allergies, iconName: "pawprint")
                        }
                        
                        
                        Button(action: {
                            presentedSheet = .medications
                        }) {
                            HealthItemView(title: "Medications", listOfItems: pet.medicalRecord.medications, iconName: "pills.circle.fill")
                        }
                        
                        
                        Button(action: {
                            presentedSheet = .appointments
                        }) {
                            HealthItemView(title: "Appointments", listOfItems: pet.medicalRecord.appointments.map { "\($0)" }, iconName: "calendar.badge.clock")
                        }
                        
                        
                        Button(action: {
                            presentedSheet = .vaccinations
                        }) {
                            HealthItemView(title: "Vaccinations", listOfItems: pet.medicalRecord.vaccinations.map { "\($0)" }, iconName: "syringe.fill")
                        }
                    }
                    .padding()
                }
            }
            .sheet(item: $presentedSheet) { sheet in
                switch sheet {
                case .allergies:
                    MedicalRecordSheetView(title: "Allergies", content: pet.medicalRecord.allergies.joined(separator: ", "))
                case .medications:
                    MedicalRecordSheetView(title: "Medications", content: pet.medicalRecord.medications.joined(separator: ", "))
                case .appointments:
                    MedicalRecordSheetView(title: "Appointments", content: pet.medicalRecord.appointments.map { "\($0)" }.joined(separator: ", "))
                case .vaccinations:
                    MedicalRecordSheetView(title: "Vaccinations", content: pet.medicalRecord.vaccinations.map { "\($0)" }.joined(separator: ", "))
                }
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    let samplePet = Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(allergies: ["Peanuts"], medications: ["Antihistamine"], appointments: [], vaccinations: []), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    container.mainContext.insert(samplePet)
    
    return HealthView(pet: samplePet)
        .modelContainer(container)
}
