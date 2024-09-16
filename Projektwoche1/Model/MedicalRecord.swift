//
//  MedicalRecord.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 16.09.24.
//

import Foundation
import SwiftData

@Model
class MedicalRecord {
let Id: String = UUID().uuidString
var allergies: [String] = []
var medications: [String] = []
var appointments: [Appointment] = []
var vaccionations: [Vaccine] = []

    init(allergies: [String], medications: [String], appointments: [Appointment], vaccionations: [Vaccine]) {
        self.allergies = allergies
        self.medications = medications
        self.appointments = appointments
        self.vaccionations = vaccionations
    }

}
