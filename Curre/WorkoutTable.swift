//
//  WorkoutTable.swift
//  Curre
//
//  Created by Student on 4/26/23.
//

import Foundation
import UIKit
import CoreData

class WorkoutTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let defaults = UserDefaults.standard
    var workouts:[WorkoutEntity] = []
    var displayWorkout: WorkoutEntity!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let workout = workouts[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        cell.textLabel?.text = workout.name
        cell.detailTextLabel?.text = "\(dateFormatter.string(from: workout.date!))"

        return cell
    }
    
    func deleteWorkout(indexPath: IndexPath) {
        let workout = workouts[indexPath.row]
        workouts.remove(at: indexPath.row)
        context.delete(workout)
        table.deleteRows(at: [indexPath], with: .fade)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            [weak self] (action, view, completionHandler) in self?.deleteWorkout(indexPath: indexPath)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Inside select function")
        let selectedWorkout = workouts[indexPath.row]
        displayWorkout = selectedWorkout
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "WorkoutViewController") as? WorkoutViewController {
            print("inside if let")
            viewController.workout = displayWorkout
            print("Before prgrammatic segue")
//            navigationController?.pushViewController(viewController, animated: true)
//            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
            
            print("after prgrammtic segue")
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
