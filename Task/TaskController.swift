//
//  TaskController.swift
//  Task
//
//  Created by Parker Donat on 3/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    private let kTaskKey = "tasks"
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    // var tasksArray: [Task]
    var mockTasks:[Task] {
        let sampleTask1 = Task(name: "Go grocery shopping", notes: "Costco")
        let sampleTask2 = Task(name: "Pay rent", notes: "344 South State Street, SLC, Utah", due: NSDate(timeIntervalSinceNow: NSTimeInterval(60*60*24*3)))
        let sampleTask3 = Task(name: "Finish work project")
        let sampleTask4 = Task(name: "Install new light fixture", notes: "Downstairs bathroom")
        sampleTask4.isComplete = true
        let sampleTask5 = Task(name: "Order pizza")
        sampleTask5.isComplete = true
        
        return [sampleTask1, sampleTask2, sampleTask3, sampleTask4]
    }
    
    init() {
        tasks = mockTasks
        
    // persistent?
        
    }

    var completedTasks: [Task] {
        return tasks.filter({$0.isComplete.boolValue})
        //return tasksArray.filter({$0.isComplete.boolValue})
    }
    
    var incompleteTasks: [Task] {
        return tasks.filter({!$0.isComplete.boolValue})
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(task: Task) {

        if let index = self.tasks.indexOf(task) {
            tasks.removeAtIndex(index)
        }
        
        // save here
    }
    
    //MARK: - Persistence
    
    
    
}