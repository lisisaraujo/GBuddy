//
//  ActivityType.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

import Foundation

enum ActivityType: String, CaseIterable, Identifiable, Codable {
    case walks, sleep, playtime, training
    var id: String { self.rawValue }
}
