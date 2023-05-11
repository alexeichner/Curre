//
//  Workout.swift
//  Curre
//
//  Created by Sleepy on 4/25/23.
//

import Foundation
import UIKit

class Workout: Codable{
    
    var duration: Int = 0
    var caloriesBurned: Int = 0
    var distance: Int = 0
    var averagePace: Int = 0
    
    init(duration: Int, caloriesBurned: Int, distance: Int, averagePace: Int) {
        self.duration = duration
        self.caloriesBurned = caloriesBurned
        self.distance = distance
        self.averagePace = averagePace
    }
   
}
