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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoreData()
        self.table.reloadData()
    }
    
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
