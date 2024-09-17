//
//  HealthView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI
import SwiftData

struct HealthView: View {
    
    @Binding var selectedPet: Pet
    
    var medicalRecord: MedicalRecord
    
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
        VStack {
            HStack {
                Text("Health View")
                    .font(.headline)
                Spacer()
                Button(action: {
                    // TODO() navigate to add health track view
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
            .padding()
            
            List {
                Button(action: {
                    presentedSheet = .allergies // set the active sheet to allergies
                }) {
                    
                    HealthItemView(title: "Allergies", listOfItems: medicalRecord.allergies, iconName: "pawprint")
                        .padding()
                    
                }
                
                Button(action: {
                    presentedSheet = .medications
                }) {
                    Text("Medications: \(medicalRecord.medications.isEmpty ? "None" : String(medicalRecord.medications.count))")
                }
                
                Button(action: {
                    presentedSheet = .appointments
                }) {
                    Text("Appointments: \(medicalRecord.appointments.isEmpty ? "None" : String(medicalRecord.appointments.count))")
                }
                
                Button(action: {
                    presentedSheet = .vaccinations
                }) {
                    Text("Vaccinations: \(medicalRecord.vaccinations.isEmpty ? "None" : String(medicalRecord.vaccinations.count))")
                }
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
                // call the MedicalRecordSheetView with the correct content, depending on the selected view
            case .allergies:
                MedicalRecordSheetView(title: "Allergies", content: medicalRecord.allergies.joined(separator: ", "))
            case .medications:
                MedicalRecordSheetView(title: "Medications", content: medicalRecord.medications.joined(separator: ", "))
            case .appointments:
                MedicalRecordSheetView(title: "Appointments", content: medicalRecord.appointments.map { "\($0)" }.joined(separator: ", "))
            case .vaccinations:
                MedicalRecordSheetView(title: "Vaccinations", content: medicalRecord.vaccinations.map { "\($0)" }.joined(separator: ", "))
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    // Preview data
    let sampleMedicalRecord = MedicalRecord(allergies: ["Peanuts"], medications: ["Antihistamine"], appointments: [], vaccinations: [])
    
    let samplePet = Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: sampleMedicalRecord, owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    
    
    container.mainContext.insert(samplePet)
    
    return HealthView(selectedPet: .constant(samplePet), medicalRecord: sampleMedicalRecord)
        .modelContainer(container)
}
