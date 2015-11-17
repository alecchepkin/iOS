//
//  ChecklistItem.swift
//  Checklists
//
//  Created by legr on 12/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toogleChecked(){
        self.checked = !self.checked
    }
}