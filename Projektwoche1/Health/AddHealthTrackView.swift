//
//  AddHealthTrackView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import SwiftUI
import SwiftData

struct AddHealthTrackView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var selectedTab: HealthTrackType = .allergy // default tab selection
    @State private var newAllergy: String = ""
    @State private var newMedication: String = ""
    @State private var newAppointmentDate: Date = Date()
    @State private var selectedVet: Vet?
    @State private var newVaccineName: String = ""
    @State private var vaccinatedUntil: Date = Date()
    
    @State var pet: Pet
    var vets: [Vet] = []
    
    enum HealthTrackType {
        case allergy
        case medication
        case appointment
        case vaccination
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // menu for selecting health track type
                Picker("Select Health Track", selection: $selectedTab) {
                    Text("Allergies").tag(HealthTrackType.allergy)
                    Text("Medications").tag(HealthTrackType.medication)
                    Text("Appointments").tag(HealthTrackType.appointment)
                    Text("Vaccinations").tag(HealthTrackType.vaccination)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Form {
                    // display form based on the selected tab
                    switch selectedTab {
                    case .allergy:
                        Section(header: Text("Allergy Information")) {
                            TextField("Enter allergy", text: $newAllergy)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: addAllergy) {
                                Text("Add Allergy")
                            }
                        }
                        
                    case .medication:
                        Section(header: Text("Medication Information")) {
                            TextField("Enter medication", text: $newMedication)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: addMedication) {
                                Text("Add Medication")
                            }
                        }
                        
                    case .appointment:
                        Section(header: Text("Appointment Information")) {
                            DatePicker("Select Appointment Date", selection: $newAppointmentDate, displayedComponents: .date)
                            
                            Picker("Select Vet", selection: $selectedVet) {
                                ForEach(vets) { vet in
                                    Text(vet.fullName).tag(vet as Vet?)
                                }
                            }
                            
                            Button(action: addAppointment) {
                                Text("Add Appointment")
                            }
                        }
                        
                    case .vaccination:
                        Section(header: Text("Vaccination Information")) {
                            TextField("Enter vaccine name", text: $newVaccineName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            DatePicker("Vaccinated Until", selection: $vaccinatedUntil, displayedComponents: .date)
                            
                            Button(action: addVaccine) {
                                Text("Add Vaccine")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add Health Track")
            .navigationBarItems(trailing:
                Button("Save") {
                    saveChanges()
                }
            )
        }
    }

    private func addAllergy() {
        if !newAllergy.isEmpty {
            pet.medicalRecord.allergies.append(newAllergy)
            newAllergy = ""
            saveChanges()
        }
    }

    private func addMedication() {
        if !newMedication.isEmpty {
            pet.medicalRecord.medications.append(newMedication)
            newMedication = ""
            saveChanges()
        }
    }

    private func addAppointment() {
        guard let vet = selectedVet else { return }
        
        let appointment = Appointment(title: "Appointment with \(vet.fullName)", date: newAppointmentDate, comment: "Follow-up appointment.", vet: vet, medicalRecord: pet.medicalRecord)
        
        pet.medicalRecord.appointments.append(appointment)
        saveChanges()
    }

    private func addVaccine() {
        if !newVaccineName.isEmpty {
            let vaccine = Vaccine(name: newVaccineName, vaccinatedOn: Date(), vaccinatedUntil: vaccinatedUntil, medicalRecord: pet.medicalRecord)

            pet.medicalRecord.vaccinations.append(vaccine)
            
            newVaccineName = ""
            saveChanges()
        }
    }

    private func saveChanges() {
        do {
            try context.save()
        } catch {
            print("Failed to save changes to pet's medical record: \(error.localizedDescription)")
           
        }
        
        dismiss()
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    let samplePet = Pet(name: "Baco", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: []))
    
    let sampleVet1 = Vet(fullName: "Joel Altes", assignedPets: [], appointments: [])
    let sampleVet2 = Vet(fullName: "Marta Smith", assignedPets: [], appointments: [])
    
    return AddHealthTrackView(pet: samplePet)
}

