//
//  HomeTabView.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import SwiftUI
import SwiftData

enum Tab {
    case pet, activities, health
}

struct HomeTabView: View {
    // The information about a single pet is being passed from the Home View.
    @State var selectedPet: Pet
    @State private var selectedTab: Tab = .pet
    
    var body: some View {
        NavigationStack {
            // The user should be able to navigate to 3 different major subviews: Pet, Activities, and Health
            TabView(selection: $selectedTab) {
                PetView(pet: selectedPet)
                    .tabItem {
                        Label("Pet", systemImage: "dog.circle")
                    }.tag(Tab.pet)

                // Activities view
                ActivityOverview(pet: selectedPet)
                    .tabItem {
                        Label("Activities", systemImage: "flag.2.crossed.circle")
                    }.tag(Tab.activities)

                // Health view
                HealthView(pet: selectedPet)
                    .tabItem {
                        Label("Health", systemImage: "cross.circle")
                    }.tag(Tab.health)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedTab == .pet {
                        NavigationLink(destination: AddPetView()) {
                            Image(systemName: "pencil")
                        }
                    } else if selectedTab == .activities {
                        NavigationLink(destination: AddPetView()) {
                            // TODO: add AddActivityView destination
                            Image(systemName: "plus.circle")
                        }
                    } else if selectedTab == .health {
                        NavigationLink(destination: AddHealthTrackView(pet: selectedPet)) {
                            Image(systemName: "plus.circle")
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
