// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class CustomerListTableViewController: UITableViewController {
    
    let dataSource = ContactsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataSource.countOfContacts()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
        
        let cellContact = dataSource.contactAtIndex(contactIndex: indexPath.row)
        
        cell.textLabel?.text = cellContact.lastname
        cell.detailTextLabel?.text = cellContact.firstname
        
        return cell
    }

    @IBAction func Save(segue:UIStoryboardSegue){
        let source = segue.sourceViewController as! NewContactTableViewController
        
        let newContact = source.contact
        
        dataSource.addContact(contact: newContact)
        
        self.tableView.reloadData()
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        dataSource.deleteContact(indexPath.row)
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ContactDetailsSegue"){
            let selectedIndex = tableView.indexPathForSelectedRow()?.row
            let selectedContact = dataSource.contactAtIndex(contactIndex: selectedIndex!)
            let destination = segue.destinationViewController as! ContactDetailsViewController
            destination.contact = selectedContact
        }
    }
    
    
}
