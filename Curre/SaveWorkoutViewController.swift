//
//  SaveWorkoutViewController.swift
//  Curre
//
//  Created by Happy Alex on 5/12/23.
//

import UIKit

class SaveWorkoutViewController: UIViewController {
    
    @IBOutlet weak var saveWorkoutButton: UITextField!
    @IBOutlet weak var distanceTextfield: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var timeString = ""
    var totalSeconds = 0
    var timeOfDayString = "Afternoon"
    let date = Date()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(timeString)
        print(totalSeconds)
        checkTimeOfDay()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveWorkoutFunction(_ sender: Any) {
        let distance = distanceTextfield.text
        if true { //check to see if distance is number
            let workout = WorkoutEntity(context: context)
            workout.name = "\(timeOfDayString) Run"
            workout.time = timeString
            workout.distance = Int64(distance!)!
            workout.date = date
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            //make pop up
        }
        
    }
    
    func checkTimeOfDay() {
        dateFormatter.dateFormat = "hh"
        print("\(dateFormatter.string(from: date))")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
