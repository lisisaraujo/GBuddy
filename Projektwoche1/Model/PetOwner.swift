//
//  PetOwner.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import Foundation
import SwiftData

@Model
class PetOwner {
    var name : String
    var surName : String
    var ownedPets : [Pet]
    
    init(name: String, surName: String, ownedPets: [Pet]) {
        self.name = name
        self.surName = surName
        self.ownedPets = ownedPets
    }
}
