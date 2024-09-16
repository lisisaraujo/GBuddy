//
//  Vaccine.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 16.09.24.
//

import Foundation
import SwiftData

@Model
class Vaccine: Identifiable {
    let Id: String = UUID().uuidString
    var name : String
    var vaccinatedOn : Date
    var vaccinatedUntil :  Date
    @Relationship(inverse: \MedicalRecord.vaccionations)
    var medicalRecord: MedicalRecord
    
    init(name: String, vaccinatedOn: Date, vaccinatedUntil: Date, medicalRecord: MedicalRecord) {
        self.name = name
        self.vaccinatedOn = vaccinatedOn
        self.vaccinatedUntil = vaccinatedUntil
        self.medicalRecord = medicalRecord
    }
}
