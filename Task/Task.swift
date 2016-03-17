//
//  Task.swift
//  Task
//
//  Created by Parker Donat on 3/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    private let kNameKey = "name"
    private let kNotesKey = "notes"
    private let kDueKey = "due"
    private let kCompleteKey = "isComplete"
    
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
    
    // MARK: NSCoding
    
    @objc required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String else {
            
            self.name = ""
            self.notes = ""
            self.isComplete = false
            
            super.init()
            return nil
        }
        
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(kNotesKey) as? String
        self.due = aDecoder.decodeObjectForKey(kDueKey) as? NSDate
        self.isComplete = aDecoder.decodeBoolForKey(kCompleteKey)
        
        super.init()
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: kNameKey)
        aCoder.encodeObject(self.notes, forKey: kNotesKey)
        aCoder.encodeObject(self.due, forKey: kDueKey)
        aCoder.encodeBool(self.isComplete, forKey: kCompleteKey)
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? Task {
            return (self.name == rhs.name) && (self.notes == rhs.notes) && (self.isComplete == rhs.isComplete)
        } else {
            return false
        }
    }

}

func ==(lhs: Task, rhs: Task) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}


