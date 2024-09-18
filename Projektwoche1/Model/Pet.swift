//
//  Pet.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import Foundation
import SwiftData

@Model
class Pet: Identifiable {
    
    let id: String = UUID().uuidString
    
    //    General Information
    var name : String
    var type : PetType
    
    //    Pet Data
    var isChipped : Bool
    var chipNum : Int?
    var birthDate : Date
    
    //    Characteristcs
    var color: String
    var weight: Double
    var size: PetSize
    var breed : String
    
    @Relationship(inverse: \Vet.assignedPets)
    var petsVet: Vet?
    
    var medicalRecord: MedicalRecord
    
    var activities : [Activity]
    
    var image : String {
        switch type{
        case .dog:
            return "dog"
        case .cat:
            return "kitty"
        case .bird:
            return "kitty"
        case .other:
            return "kitty"
        }
    }
    
    @Relationship(inverse: \PetOwner.ownedPets)
    var owner : PetOwner
    
    init(name: String, type: PetType, isChipped: Bool, chipNum: Int? = nil, birthDate: Date, color: String, weight: Double, size: PetSize, breed: String, petsVet: Vet? = nil, medicalRecord: MedicalRecord = MedicalRecord(), activities: [Activity] = [], owner: PetOwner) {
        self.name = name
        self.type = type
        self.isChipped = isChipped
        self.chipNum = chipNum
        self.birthDate = birthDate
        self.color = color
        self.weight = weight
        self.size = size
        self.breed = breed
        self.petsVet = petsVet
        self.medicalRecord = medicalRecord
        self.activities = activities
        self.owner = owner
    }
}

enum PetSize : String, Codable {
    case small = "Small"
    case medium = "Medium"
    case big = "Big"
}

enum PetType: String, Codable{
    case dog = "Dog"
    case cat = "Cat"
    case bird = "Bird"
    case other = "Other"
}


