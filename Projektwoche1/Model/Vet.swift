//
//  Vet.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 16.09.24.
//

import Foundation
import SwiftData


@Model
open class Vet: Identifiable {
    let Id: String = UUID().uuidString
    var name : String
    var surName : String
    var assignedPets : [Pet]
    var appointments: [Appointment]
    
    init(name: String, surName: String, assignedPets: [Pet]) {
        self.name = name
        self.surName = surName
        self.assignedPets = assignedPets
    }
}
