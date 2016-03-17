//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Parker Donat on 3/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    var task: Task?
    
    var dueDateValue: NSDate?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePickers: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Replaces the keyboard of the UITextField to capture the due date with your UIDatePicker
        
        taskDueTextField.inputView = dueDatePickers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveButtonPressed(sender: AnyObject) {
        updateTask()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonPresssed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickersValueChanged(sender: UIDatePicker) {
        self.taskDueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
//    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
//        self.taskDueTextField.text = sender.date.stringValue()
//        self.dueDateValue = sender.date
//    }
    
    @IBAction func userTappedOnView(sender: AnyObject) {
        
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
    }
    
    func updateTask() {
        
        let name = taskNameTextField.text!
        let due = dueDateValue
        let notes = taskNotesTextView.text
        
        if let task = self.task {
            task.name = name
            task.due = due
            task.notes = notes
        } else {
            
            let newTask = Task(name: name, notes: notes, due: due)
            TaskController.sharedInstance.addTask(newTask)
        }
    }
    
    
    func updateWithTask(task: Task) {
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
