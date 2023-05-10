//
//  WorkoutTable.swift
//  Curre
//
//  Created by Student on 4/26/23.
//

import Foundation
import UIKit
import CoreData

class WorkoutTable: UITableViewController {
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let defaults = UserDefaults.standard
    var workouts:[Workout] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let workoutDefaults = defaults.array(forKey: "workouts")
    }
    
    func setWorkout<Workout>(_ workout: Workout, forKey: String) where Workout: Encodable
    {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(workout)
            set(data, forKey: forKey)
            synchronize()
        } catch let encodeErr {
            print("Failed to encode object:", encodeErr)
        }
    }
        
    func getWorkout<Workout>(forKey: String, castTo type: Workout.Type) -> Workout? where Workout: Decodable
    {
        guard let data = data(forKey: forKey) else { return nil }
        let decoder = JSONDecoder()
        do {
            let workout = try decoder.decode(type, from: data)
            return workout
        } catch let decodeError{
            print("Failed to decode object:" , decodeError)
            return nil
        }
    }
    
//    func getCoreData() {
//
//
//        do {
//          //  workouts = try context.fetch(WorkoutEntity.fetchRequest())
//        } catch {
//            print("data not found")
//        }
//
//
//    }
}
