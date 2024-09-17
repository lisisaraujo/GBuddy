//
//  PetView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI
import SwiftData

struct PetView: View {
    
    // Pet view screen displays all the general information about the pet.
    @State var pet: Pet
    
    var body: some View {
        VStack {
            Text("This is a pet view screen")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Pet's name:")
                    .fontWeight(.bold)
                Text(pet.name)
                    .foregroundColor(.primary)
            }
            .padding()
            
            // Additional pet information can be displayed here
            Text("Pet's type: \(pet.type.rawValue)") // Assuming type is an enum with raw values
            Text("Is Chipped: \(pet.isChipped ? "Yes" : "No")")
            Text("Birth Date: \(pet.birthDate.formatted())") // Format date as needed
            Text("Color: \(pet.color)")
            Text("Weight: \(pet.weight, specifier: "%.1f") kg") // Format weight to one decimal place
            Text("Size: \(pet.size.rawValue)") // Assuming size is an enum with raw values
            Text("Breed: \(pet.breed)")// Assuming breed is an enum with raw values
        }
        .padding()
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    // Preview data
    let samplePet = Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    container.mainContext.insert(samplePet)

    return PetView(pet: samplePet)
        .modelContainer(container)
}
