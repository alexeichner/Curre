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
    var timeOfDayString = ""
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
        //if isNumber(number: distance ?? "none") { //check to see if distance is number
            let workout = WorkoutEntity(context: context)
            workout.name = "\(timeOfDayString) Run"
            workout.time = timeString
            workout.distance = Int64(distance!)!
            workout.date = date
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // } else {
//            let alertController = UIAlertController(title: "Error", message: "Please Enter a numeric digit. Example: 4", preferredStyle: .alert)
//            present(alertController, animated: true)
//            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
//            return
       // }
        performSegue(withIdentifier: "saveWorkoutSegue", sender: nil)
    }
    
    func checkTimeOfDay() {
        dateFormatter.dateFormat = "hh"
        print("\(dateFormatter.string(from: date))")
    }
    
    func isNumber(number: String) -> Bool {
        if number == "none" {
            return false
        } else {
            var totalCharacters = number.count
            var characterCount = 0
            for digit in number {
                if (digit=="0") || (digit=="1") || (digit=="2") || (digit=="3") || (digit=="4") || (digit=="5") || (digit=="6") || (digit=="7") || (digit=="8") || (digit=="9") {
                    characterCount += 1
                    if characterCount == totalCharacters {
                        return true
                    } else {
                        return false
                    }
                }
            }
            return true
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
