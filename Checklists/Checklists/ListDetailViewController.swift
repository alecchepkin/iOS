//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by legr on 20/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(controller: ListDetailViewController)
    func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist:Checklist)
    func listDetailViewController(controller: ListDetailViewController, didFinishEditingChecklist checklist:Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.enabled = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let checklist = checklistToEdit {
        checklist.name = textField.text!
        delegate?.listDetailViewController(self,
        didFinishEditingChecklist: checklist)
    } else {
        let checklist = Checklist(name: textField.text!)
        delegate?.listDetailViewController(self,
        didFinishAddingChecklist: checklist)
        }
    }
}
