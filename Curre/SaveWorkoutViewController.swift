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
    
    var timeString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(timeString)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveWorkoutFunction(_ sender: Any) {
        let distance = distanceTextfield.text
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
