//
//  InterfaceController.swift
//  Timer WatchKit Extension
//
//  Created by Wakamori on 2021/01/03.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var myTimer: WKInterfaceTimer!
    @IBOutlet weak var timerButton: WKInterfaceButton!
    
    var isTimerStarted = false
    var startTime = Date()
    var elapsedTime: TimeInterval = 0.0
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        myTimer.setDate(Date())
        myTimer.start()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func myTimeraction() {
        isTimerStarted = !isTimerStarted
            if isTimerStarted {
                startTime = Date()
                timerButton.setTitle("STOP")
                //myTimer.setDate(Date())
                myTimer.setDate(Date(timeIntervalSinceNow: elapsedTime))
                myTimer.start()
            } else {
                let stoppedTime = Date()
                elapsedTime -= stoppedTime.timeIntervalSince(startTime)
                timerButton.setTitle("START")
                myTimer.stop()
            }
        }
    }
    
    

