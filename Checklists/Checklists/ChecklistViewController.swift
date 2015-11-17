//
//  ViewController.swift
//  Checklists
//
//  Created by legr on 11/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let item0 = ChecklistItem()
        item0.text = "item 0"
        item0.checked = true
        items.append(item0)
        
        let item1 = ChecklistItem()
        item1.text = "item 1"
        item1.checked = true
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "item 2"
        item2.checked = false
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "item 3"
        item3.checked = false
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "item 4"
        item4.checked = false
        items.append(item4)
        
        super.init(coder: aDecoder)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let item = self.items[indexPath.row]
        
        self.configureTextForCell(cell, withCheckListItem: item)
        self.configureCheckmarkForCell(cell, withChecklistItem: item)
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            let item = self.items[indexPath.row]
            item.toogleChecked()
            self.configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureTextForCell(cell: UITableViewCell, withCheckListItem item:ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmarkForCell(cell:UITableViewCell, withChecklistItem item: ChecklistItem){
        if item.checked == true{
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
    }

    @IBAction func addItem(){
        let newRowIndex = self.items.count
        let item = ChecklistItem()
        item.text = "New item"
        item.checked = false
        items.append(item)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.items.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
}

