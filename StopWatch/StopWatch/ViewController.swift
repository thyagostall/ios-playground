//
//  ViewController.swift
//  StopWatch
//
//  Created by Thyago on 1/5/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Properties
    private let HOUR_COLUMN = 0;
    private let MINUTE_COLUMN = 1;
    private let SECOND_COLUMN = 2;
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var playButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    @IBOutlet var rewindButton: UIBarButtonItem!

    var timer: NSTimer?

    var seconds = 0
    var minutes = 0
    var hours = 0
    
    // MARK: Actions
    @IBAction func start(sender: UIBarButtonItem?) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        
        playButton.enabled = false
        pauseButton.enabled = true
        rewindButton.enabled = true
    }
    
    @IBAction func pause(sender: UIBarButtonItem?) {
        timer?.invalidate()
        
        playButton.enabled = true
        pauseButton.enabled = false
        rewindButton.enabled = true
        
        update()
    }
    
    @IBAction func reset(sender: UIBarButtonItem?) {
        timer?.invalidate()

        seconds = 0
        minutes = 0
        hours = 0
        
        playButton.enabled = true
        pauseButton.enabled = false
        rewindButton.enabled = false
        
        update()
    }
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        reset(nil)
        
        update()
    }
    
    func tick() {
        seconds++
        if seconds == 60 {
            seconds = 0
            minutes++
        }
        if minutes == 60 {
            minutes = 0
            hours++
        }
        
        update()
    }
    
    func update() {
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        
        pickerView.selectRow(hours, inComponent: HOUR_COLUMN, animated: true)
        pickerView.selectRow(minutes, inComponent: MINUTE_COLUMN, animated: true)
        pickerView.selectRow(seconds, inComponent: SECOND_COLUMN, animated: true)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == HOUR_COLUMN {
            return 100
        } else {
            return 60
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        return formatter.stringFromNumber(row)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }

}

