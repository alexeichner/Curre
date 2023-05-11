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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let defaults = UserDefaults.standard
    var workouts:[WorkoutEntity] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let workoutDefaults = defaults.array(forKey: "workouts")
//        setWorkout(workouts, forKey: "workouts")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoreData()
        self.table.reloadData()
    }
    
//    func setWorkout<Workout>(_ workout: Workout, forKey: String) where Workout: Encodable
//    {
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(workout)
//            set(data, forKey: forKey)
//            synchronize()
//        } catch let encodeErr {
//            print("Failed to encode object:", encodeErr)
//        }
//    }
//
//    func getWorkout<Workout>(forKey: String, castTo type: Workout.Type) -> Workout? where Workout: Decodable
//    {
//        guard let data = data(forKey: forKey) else { return nil }
//        let decoder = JSONDecoder()
//        do {
//            let workout = try decoder.decode(type, from: data)
//            return workout
//        } catch let decodeError{
//            print("Failed to decode object:" , decodeError)
//            return nil
//        }
//    }
    
    func getCoreData() {


        do {
            workouts = try context.fetch(WorkoutEntity.fetchRequest())
        } catch {
            print("data not found")
        }


    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        cell.detailTextLabel?.text = "Time: \(workout.time), Distance: \(workout.distance)"
        
        return cell
    }

}
