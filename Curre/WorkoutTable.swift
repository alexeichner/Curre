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
    var workouts:[Workout] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getCoreData() {
        
        
        do {
          //  workouts = try context.fetch(WorkoutEntity.fetchRequest())
        } catch {
            print("data not found")
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return workouts.count
        }
    }
}
