//
//  Appointment.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 16.09.24.
//

import Foundation
import SwiftData

@Model
class Appointment: Identifiable {
    let id: String = UUID().uuidString
    var title : String
    var date : Date
    var comment : String
    @Relationship(inverse: \Vet.appointments)
    var vet: Vet
    
    @Relationship(inverse: \MedicalRecord.appointments)
    var medicalRecord: MedicalRecord
    
    init(title: String, date: Date, comment: String = "", vet: Vet, medicalRecord: MedicalRecord) {
        self.title = title
        self.date = date
        self.comment = comment
        self.vet = vet
        self.medicalRecord = medicalRecord
    }
    
}
