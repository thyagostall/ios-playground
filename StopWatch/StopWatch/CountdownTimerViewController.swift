//
//  CountdownTimerViewController.swift
//  StopWatch
//
//  Created by Thyago on 1/7/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit

class CountdownTimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var timePicker: UIPickerView!
    
    private let HOUR_COLUMN = 0;
    private let MINUTE_COLUMN = 1;
    private let SECOND_COLUMN = 2;
    
    private var hour = 0;
    private var minute = 0;
    private var second = 0;
    
    private var initialHour = 0;
    private var initialMinute = 0;
    private var initialSecond = 0;
    
    private var timer: NSTimer?
    
    @IBOutlet var startButton: UIBarButtonItem!
    @IBOutlet var stopButton: UIBarButtonItem!
    @IBOutlet var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.enabled = true
        stopButton.enabled = false
        resetButton.enabled = false
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
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
    
    func update() {
        second--
        if second < 0 {
            second = 59
            minute--
        }
        if minute < 0 {
            minute = 59
            hour--
        }
        if hour < 0 {
            hour = 0
            minute = 0
            second = 0
            stop(nil)
        }

        timePicker.selectRow(hour, inComponent: HOUR_COLUMN, animated: true)
        timePicker.selectRow(minute, inComponent: MINUTE_COLUMN, animated: true)
        timePicker.selectRow(second, inComponent: SECOND_COLUMN, animated: true)
    }

    @IBAction func start(sender: UIBarButtonItem?) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        timePicker.userInteractionEnabled = false
        
        hour = timePicker.selectedRowInComponent(HOUR_COLUMN)
        minute = timePicker.selectedRowInComponent(MINUTE_COLUMN)
        second = timePicker.selectedRowInComponent(SECOND_COLUMN)
        
        initialHour = hour
        initialMinute = minute
        initialSecond = second
        
        startButton.enabled = false
        stopButton.enabled = true
        resetButton.enabled = true
    }
    
    
    @IBAction func stop(sender: UIBarButtonItem?) {
        timer?.invalidate()
        timePicker.userInteractionEnabled = true
        
        startButton.enabled = true
        stopButton.enabled = false
        resetButton.enabled = false
    }
    
    @IBAction func reset(sender: UIBarButtonItem?) {
        timePicker.selectRow(initialHour, inComponent: HOUR_COLUMN, animated: true)
        timePicker.selectRow(initialMinute, inComponent: MINUTE_COLUMN, animated: true)
        timePicker.selectRow(initialSecond, inComponent: SECOND_COLUMN, animated: true)
        
        timer?.invalidate()
        timePicker.userInteractionEnabled = true
        
        startButton.enabled = true
        stopButton.enabled = false
        resetButton.enabled = false
    }
    
    
}
