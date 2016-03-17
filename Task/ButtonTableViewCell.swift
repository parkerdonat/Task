//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Parker Donat on 3/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    // MARK: - Complete Button Drawing Properties
    
    var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            completedButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completedButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
}

protocol ButtonTableViewCellDelegate {

    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}
