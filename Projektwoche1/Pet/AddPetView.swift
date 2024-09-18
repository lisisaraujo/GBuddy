//
//  AddPetView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//


//
// AddPetView.swift
// Projektwoche1
//
// Created by Jakub Zwierz on 18.09.24.
//
import SwiftUI
import SwiftData
struct AddPetView: View {
  @Environment(\.modelContext) private var context
  //  General Information
  @State var name : String = ""
  @State var type : PetType = .other
  //  Pet Data
  @State var isChipped : Bool = false
  //  Chip number
  @State var chipNumberInput : String = ""
  @State var chipNum : Int?
  @State var birthDate : Date = Date()
  //  Characteristcs
  @State var color : String = ""
  @State var weight : Double = 0.0
  @State var size : PetSize = .small
  @State var breed : String = ""
  var body: some View {
    VStack{
      Form{
        Section("General"){
          TextField("Name", text: $name)
          Picker("Pet type", selection: $type) {
            Text("Cat").tag(PetType.cat)
            Text("Dog").tag(PetType.dog)
            Text("Bird").tag(PetType.bird)
            Text("Other").tag(PetType.other)
          }
        }
        Section("Data"){
          Toggle("Chipped", isOn: $isChipped)
          if isChipped {
            TextField("Chip number", text: $chipNumberInput)
          }
          DatePicker("Date of birth", selection: $birthDate)
        }
        Section("Characteristcs"){
          TextField("Color", text: $color)
          Slider(
            value: $weight,
            in: 0...60,
            step: 1) {
              Text("Weight")
            } minimumValueLabel: {
              Text("5.0")
            } maximumValueLabel: {
              Text("60.0")
            }
          HStack{
            Text("Selected weight: ")
            Spacer()
              .frame(width: 150)
            Text("\(weight.formatted())")
          }
          Picker("Pet size", selection: $size) {
            Text("Small").tag(PetSize.small)
            Text("Medium").tag(PetSize.medium)
            Text("Big").tag(PetSize.big)
          }
          TextField("Breed", text: $breed)
        }
      }
      Button() {
        let newPet = Pet(name: name,
          type: type,
          isChipped: isChipped,
          chipNum: chipNum,
          birthDate: birthDate,
          color: color,
          weight: weight,
          size: size,
          breed: breed,
                         petsVet: Vet(fullName: "Thomas Musterman",
                 assignedPets: [],
                 appointments: []),
          medicalRecord: MedicalRecord(allergies: [],
                         medications: [],
                         appointments: [],
                         vaccinations: []),
          activities : [Activity(name: "Test Activity",
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
        context.insert(newPet)
      } label: {
        Text("Submit")
          .foregroundColor(.white)
          .background(
            Rectangle()
              .frame(width: 128,height: 46)
              .cornerRadius(10)
          )
      }
    }
  }
}
#Preview {
  AddPetView()
}
