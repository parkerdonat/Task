//
//  TaskController.swift
//  Task
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    private let TaskKey = "tasks"
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []

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
        
        // uncomment the next line to initialize with mock task data
        self.tasks = self.mockTasks
        
        loadFromPersistentStorage()
    }
    
    var completedTasks: [Task] {
        return tasks.filter({$0.isComplete})
    }
    
    var incompleteTasks: [Task] {
        return tasks.filter({!$0.isComplete})
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        if let index = self.tasks.indexOf(task) {
            tasks.removeAtIndex(index)
        }
    }
    
    // MARK: - PERSISTENCE YO!!!!!
    
    func saveToPersistentStorage() {
        
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: self.filePath(TaskKey))
    }
    
    func loadFromPersistentStorage() {
        
        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskKey))
        
        if let tasks = unarchivedTasks as? [Task] {
            self.tasks = tasks
        }
    }
    
    func filePath(key: String) -> String {
        
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentPath.stringByAppendingString("/\(key).plist")
     
        return entriesPath
    }
    
}
















