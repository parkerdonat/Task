//
//  DateHelpers.swift
//  Task
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

extension NSDate {
    
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        return formatter.stringFromDate(self)
    }
}