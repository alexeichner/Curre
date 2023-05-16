//
//  WorkoutViewController.swift
//  Curre
//
//  Created by Student on 5/13/23.
//

import UIKit

class WorkoutViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var workout: WorkoutEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = "Time: \(String(describing: workout.time)) \nDistance: \(workout.distance)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
