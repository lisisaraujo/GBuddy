//
//  PetSelectorElement.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import SwiftUI
import SwiftData

struct PetSelectorElement: View {
    
//    Pet selector is a single UI element, that general information about pet.
//    It is used for Home View, for the pet selection.
    
    let pet : Pet
    
    var body: some View {
        VStack{
            
            HStack{
                
                Text(pet.name)
                    .font(.custom("MarkerFelt-Thin", size: 30))
                    .frame(width: 140)
                
                Spacer()
                    .frame(width: 8)
                
                Image(pet.image)
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 120,height: 160)
                    .cornerRadius(5.0)
            }
            
        }
        .frame(width: 300, height: 200)
        .background(
            Rectangle()
                .fill(.white)
                .cornerRadius(20.0)
                .shadow(radius: 2)
        )
        
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, Appointment.self,  configurations: configuration)
    
    let testPet : Pet = Pet(name: "Woofy",
                            type: .dog,
                            isChipped: false,
                            birthDate: Date(),
                            color: "Black",
                            weight: 50,
                            size: .big,
                            breed: "Corgi",
                            owner: PetOwner(
                                name: "Tom",
                                surName: "Owner",
                                ownedPets: [])
                           )
    
    //   Preview data
    container.mainContext.insert(testPet)
    
    return PetSelectorElement(pet: testPet)
    .modelContainer(container)
}


#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    // Preview data
    let samplePet = Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    container.mainContext.insert(samplePet)
    
    return PetSelectorElement(pet: Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: [])))
        .modelContainer(container)
}
