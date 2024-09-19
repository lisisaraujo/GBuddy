//
//  Vet.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 16.09.24.
//

import Foundation
import SwiftData


@Model
class Vet: Identifiable {
    let id: String = UUID().uuidString
    var fullName : String = ""
    var assignedPets : [Pet]
    var appointments: [Appointment]
    
    init(fullName: String, assignedPets: [Pet], appointments: [Appointment]) {
        self.fullName = fullName
        self.assignedPets = assignedPets
        self.appointments = appointments
    }
}
