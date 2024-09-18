//
//  HomeView.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
//    In the home screen all pets will be listed and data should be loaded from the database
    
    @Environment(\.modelContext) var context
    
//    We are loading the pet data via query.
    
    @Query var listOfPets : [Pet] = samplePets
    
    var body: some View {
        
        NavigationStack{
            
//            After selecting a singe entry the user will navigate to the pet page, which is split into 3                  categories, or subviews. Those subviews will be accessible through the Tab view, therefore we are            navigating to the HomeTabView , which is basially a tab view host.
            
            List(listOfPets) { pet in
                NavigationLink(destination: HomeTabView(selectedPet: pet)) {
                    PetSelectorElement(pet: pet)
                }
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    // Preview data
    let samplePet = Pet(name: "Baco", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    let samplePet1 =     Pet(name: "Rex", type: .dog, isChipped: false, birthDate: Date().addingTimeInterval(-31536000), color: "Brown", weight: 30.0, size: .medium, breed: "Labrador", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Tom", surName: "Smith", ownedPets: []))
    
    let samplePet2 = Pet(name: "Tweety", type: .bird, isChipped: true, birthDate: Date().addingTimeInterval(-157788000), color: "Yellow", weight: 0.1, size: .small, breed: "Canary", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Alice", surName: "Johnson", ownedPets: []))
    
    container.mainContext.insert(samplePet)
    container.mainContext.insert(samplePet1)
    container.mainContext.insert(samplePet2)
    
    return HomeView()
        .modelContainer(container)
}
