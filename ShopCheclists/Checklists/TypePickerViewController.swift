import UIKit

protocol TypePickerViewControllerDelegate: class {
    func typePicker(picker: TypePickerViewController, didPickType typeName: String)
}

class TypePickerViewController: UITableViewController {
    weak var delegate: TypePickerViewControllerDelegate?
    
    let types = [
        "Checklist",
        "Shoplist"]
    
    
    // MARK: - Table Data Source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TypeCell", forIndexPath: indexPath)
        
        let typeName = types[indexPath.row]
        cell.textLabel!.text = typeName
        //cell.typeView!.image = UIImage(named: typeName)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let delegate = delegate {
            let typeName = types[indexPath.row]
            delegate.typePicker(self, didPickType: typeName)
        }
    }
}