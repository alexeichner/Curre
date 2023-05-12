//
//  ViewController.swift
//  Curre
//
//  Created by Happy Alex on 4/24/23.
//

import UIKit
import MapKit

class Item1: UIViewController {


    @IBOutlet weak var endWorkoutButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var timer = Timer()
    var count = 0
    var isCounting = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    @IBAction func endWorkoutFunction(_ sender: Any) {
        isCounting = false
        timer.invalidate()
        //var newWorkout = Workout(duration: count, caloriesBurned: 1, distance: 1, averagePace: 1/count)
        timerLabel.text = "00 : 00 : 00"
        count = 0
    }
    
    @IBAction func startWorkoutFunction(_ sender: Any) {
        if isCounting {
            endWorkoutButton.isHidden = false
            isCounting = false
            timer.invalidate() //stops the timer
            startButton.setTitle("START", for: .normal) //changes button text to start
        } else {
            endWorkoutButton.isHidden = true
            isCounting = true
            startButton.setTitle("PAUSE", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = formatTime(seconds: count)
        let timeString = formatTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    
    func formatTime(seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func formatTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue" {
            let viewController = segue.destination as! SaveWorkoutViewController
            viewController.timeString = timerLabel.text!
        }
    }
}

