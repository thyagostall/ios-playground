//
//  ViewController.swift
//  StopWatch
//
//  Created by Thyago on 1/5/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var playButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    @IBOutlet var rewindButton: UIBarButtonItem!

    var timer: NSTimer!

    var seconds = 0
    var minutes = 0
    var hours = 0
    
    // MARK: Actions
    @IBAction func start(sender: UIBarButtonItem) {
        start()
    }
    
    @IBAction func pause(sender: UIBarButtonItem) {
        timer.invalidate()
        update()
        
        playButton.enabled = true
        
        pauseButton.enabled = false
        rewindButton.enabled = true
    }
    
    @IBAction func reset(sender: UIBarButtonItem) {
        timer.invalidate()
        reset()
        update()
    }
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.enabled = true
        
        pauseButton.enabled = false
        rewindButton.enabled = false
        
        start()        
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        
        playButton.enabled = false
        
        pauseButton.enabled = true
        rewindButton.enabled = true
    }
    
    func tick() {
        increase()
        update()
    }
    
    func reset() {
        seconds = 0
        minutes = 0
        hours = 0
        
        playButton.enabled = true
        
        pauseButton.enabled = false
        rewindButton.enabled = false
    }
    
    func increase() {
        seconds++
        if seconds == 60 {
            seconds = 0
            minutes++
        }
        if minutes == 60 {
            minutes = 0
            hours++
        }
    }
    
    func update() {
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        
        timerLabel.text = "\(formatter.stringFromNumber(hours)!):\(formatter.stringFromNumber(minutes)!):\(formatter.stringFromNumber(seconds)!)"
    }

}

