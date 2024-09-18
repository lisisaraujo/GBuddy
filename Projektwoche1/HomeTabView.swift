//
//  HomeTabView.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import SwiftUI
import SwiftData

struct HomeTabView: View {
    
    // The information about a single pet is being passed from the Home View.
    
    @State var selectedPet : Pet
    
    
    var body: some View {
        NavigationStack {
            // The user should be able to navigate to 3 different major subviews: Pet, Activities, and Health
            TabView {
                PetView(pet: selectedPet)
                    .tabItem {
                        Label("Pet", systemImage: "dog.circle")
                    }
                
                // TODO: Replace it with ActivitiesView
                PetView(pet: selectedPet) // Assuming you will implement this view
                    .tabItem {
                        Label("Activities", systemImage: "flag.2.crossed.circle")
                    }
                
                HealthView(pet: selectedPet)
                    .tabItem {
                        Label("Health", systemImage: "cross.circle")
                    }.toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: AddHealthTrackView(pet: selectedPet)) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    // Preview data
    let samplePet = Pet(name: "Puppy", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    container.mainContext.insert(samplePet)

    return HomeTabView(selectedPet: samplePet)
        .modelContainer(container)
}
