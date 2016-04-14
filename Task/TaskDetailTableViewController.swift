//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    var dueDateValue: NSDate?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = task {
            updateViewWithTask(task)
        }
        
        // Have to make dueDatePicker to be the inputView
        taskDueTextField.inputView = dueDatePicker
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        //updateViewWithTask(task)
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.taskDueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewWithTask(task: Task) {
        
        self.task = task
        
        title = task.name
        taskNameTextField.text = task.name
        
        if let due = task.due {
            taskDueTextField.text = due.stringValue()
        }
        
        if let notes = task.notes {
            taskNotesTextView.text = notes
        }
    }
}
