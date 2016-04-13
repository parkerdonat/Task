//
//  Task.swift
//  Task
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Task: NSObject, NSCoding {
    private let NameKey = "name"
    private let NotesKey = "notes"
    private let DueKey = "due"
    private let CompleteKey = "isComplete"
    
    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool
    
    init(name: String, notes: String? = nil, due: NSDate? = nil) {
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
    }
    
    // MARK: - NSCODING
    
    @objc required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObjectForKey(NameKey) as? String,
            isComplete = aDecoder.decodeObjectForKey(CompleteKey) as? Bool else { return nil }
        
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(NotesKey) as? String
        self.due = aDecoder.decodeObjectForKey(DueKey) as? NSDate
        self.isComplete = isComplete
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: NameKey)
        aCoder.encodeObject(self.notes, forKey: NotesKey)
        aCoder.encodeObject(self.due, forKey: DueKey)
        aCoder.encodeBool(self.isComplete, forKey: CompleteKey)
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? Task {
            
            return (self.name == rhs.name) && (self.notes == rhs.notes) && (self.isComplete == rhs.isComplete)
        } else {
            return false
        }
    }
}

// MARK: Equality

func ==(lhs: Task, rhs: Task) -> Bool {
    
    return (lhs.name == rhs.name) && (lhs.notes == rhs.notes) && (lhs.isComplete == rhs.isComplete)
    
}