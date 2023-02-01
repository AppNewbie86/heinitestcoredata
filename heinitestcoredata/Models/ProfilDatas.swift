//
//  ProfilDatas.swift
//  heinitestcoredata
//
//  Created by Marcel Zimmermann on 31.01.23.
//
import SwiftUI // Brauch er dringend für das Protocol
import Foundation

// Identifizierbar sein und als Hashable gekennzeichnet sein 

struct ProfilData : Identifiable, Hashable {
    
    var id = UUID()
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var job: String
    var married: String
    var favColor : Color


}
