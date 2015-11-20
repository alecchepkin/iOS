//
//  ChecklistItem.swift
//  Checklists
//
//  Created by legr on 12/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = aDecoder.decodeObjectForKey("Text") as! String
        self.checked = aDecoder.decodeObjectForKey("Checked") as! Bool
        super.init()
    }
    func toggleChecked(){
        self.checked = !self.checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.text, forKey: "Text")
        aCoder.encodeObject(self.checked, forKey: "Checked")
    }
    
}