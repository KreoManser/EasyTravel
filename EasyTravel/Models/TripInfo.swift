//
//  TripInfo.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 11.07.2022.
//

import Foundation

var nameTrip: String?
var planTrip: Plan?
var itemsTrip: [CheckPlan] = []
var activeTrips: [TripInfo] = []

struct TripInfo: Codable {
    var name: String
    var plan: Plan
    var items: [CheckPlan]
    var id: Int
    
}
