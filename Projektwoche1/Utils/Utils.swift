//
//  Utils.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 18.09.24.
//

import Foundation


let samplePets: [Pet] = [
    Pet(name: "Baco", type: .cat, isChipped: true, birthDate: Date(), color: "Black", weight: 7.5, size: .big, breed: "None", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Lisis", surName: "Araujo", ownedPets: [])),
    
    Pet(name: "Rex", type: .dog, isChipped: false, birthDate: Date().addingTimeInterval(-31536000), color: "Brown", weight: 30.0, size: .medium, breed: "Labrador", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Tom", surName: "Smith", ownedPets: [])),
    
    Pet(name: "Tweety", type: .bird, isChipped: true, birthDate: Date().addingTimeInterval(-157788000), color: "Yellow", weight: 0.1, size: .small, breed: "Canary", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Alice", surName: "Johnson", ownedPets: [])),
    
    Pet(name: "Fluffy", type: .cat, isChipped: false, birthDate: Date().addingTimeInterval(-630720000), color: "White", weight: 10.0, size: .medium, breed: "Persian", medicalRecord: MedicalRecord(), owner: PetOwner(name: "Sarah", surName: "Williams", ownedPets: [])),
    
    Pet(name: "Buddy", type: .dog, isChipped: true, birthDate: Date().addingTimeInterval(-157788000), color: "Golden", weight: 25.0, size: .medium, breed: "Golden Retriever", medicalRecord: MedicalRecord(), owner: PetOwner(name:"Mike", surName:"Brown", ownedPets : [])),
    
    Pet(name:"Coco", type:.other, isChipped:false, birthDate : Date().addingTimeInterval(-31536000), color:"Gray", weight : 5.0, size:.small, breed:"Hamster", medicalRecord : MedicalRecord(), owner : PetOwner(name:"Emma", surName:"Davis", ownedPets : [])),
    
    Pet(name:"Charlie", type:.dog, isChipped:true, birthDate : Date().addingTimeInterval(-157788000), color:"Black and White", weight : 20.0, size:.medium, breed:"Beagle", medicalRecord : MedicalRecord(), owner : PetOwner(name:"Sophia", surName:"Miller", ownedPets : [])),
    
    Pet(name:"Polly", type:.bird, isChipped:false, birthDate : Date().addingTimeInterval(-31536000), color:"Green and Yellow", weight : 0.2, size:.small, breed:"Parakeet", medicalRecord : MedicalRecord(), owner : PetOwner(name:"James", surName:"Wilson", ownedPets : [])),
    
    Pet(name:"Maximus", type:.dog, isChipped:true, birthDate : Date().addingTimeInterval(-94608000), color:"Brindle", weight : 50.0, size:.big, breed:"Boxer", medicalRecord : MedicalRecord(), owner : PetOwner(name:"Olivia", surName:"Moore", ownedPets : [])),
    
    Pet(name:"Gizmo", type:.cat, isChipped:false, birthDate : Date().addingTimeInterval(-126230400), color:"Calico", weight : 8.0, size:.medium, breed:"Domestic Shorthair", medicalRecord : MedicalRecord(), owner : PetOwner(name:"Lucas", surName:"Taylor", ownedPets : []))
]
