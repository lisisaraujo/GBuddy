//
//  EditPetView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//


//  EditPetView.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 18.09.24.
//

import SwiftUI
import SwiftData

struct EditPetView: View {

    @State var selectedPet : Pet

    @State var newName : String = ""

    var body: some View {

        Text("Current Name")
        Text(selectedPet.name)

        Spacer()
            .frame(height: 20)
        Text("New Name")
        TextField("Name", text: $newName)
            .frame(width: 200)

        Button{
            selectedPet.name = newName
        }label: {
            Text("Save")
        }
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
                            petsVet: Vet(fullName: "Jakub",
                                         assignedPets: [],
                                        appointments: []),
                            medicalRecord: MedicalRecord(allergies: [],
                                                         medications: [],
                                                         appointments: [],
                                                         vaccinations: []),
                            activities: [Activity(name: "Test Activity",
                                                  activityDescription: "Activity description",
                                                  date: Date(),
                                                  type: .sleep,
                                                  duration: 10.0,
                                                  isDone: false)],
                            owner: PetOwner(
                                name: "Tom",
                                surName: "Owner",
                                ownedPets: [])
                           )

    //   Preview data
    container.mainContext.insert(testPet)

    return EditPetView(selectedPet: testPet)
    .modelContainer(container)
}
