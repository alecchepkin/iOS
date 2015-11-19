//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Oleg Chepkin on 19/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class{
    func addItemViewControllerDidCancel(controller:AddItemViewController)
    func addItemViewController(controller:AddItemViewController, didFinishAddingItem item:ChecklistItem)
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = self.itemToEdit{
            self.title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }
    
    @IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        if let item = self.itemToEdit {
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.addItemViewController(self, didFinishAddingItem:item)
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)

         self.doneBarButton.enabled = (newText.length > 0)
    
        return true
        
    }
    
}