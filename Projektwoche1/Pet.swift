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
    
    let id : String = UUID().uuidString
    var name : String
    @Relationship(inverse: \Vet.assignedPets)
    var vet: Vet
 
    init(name: String, vet: Vet) {
        self.name = name
        self.vet = vet
    }
}
