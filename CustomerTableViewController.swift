// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015
/*
import UIKit

class CustomerTableViewController: UITableViewController {
    var appDelegate: AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let myDataReference = appDelegate?.myCustomer
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "redSegue"{
            println("the segue is about to happen...")
            println("the destination of my segue is\(segue.destinationViewController)")
    }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let myDataReference = appDelegate?.myCustomer
        
        if let myDataCount:Int? = myDataReference?.getArrayData().count {
            println("There are \(myDataCount) rows in tableViews")
            return myDataCount!
        } else {
            println("NO DATA!!!")
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! CustomerTableViewCell
        
        let myDataReference = appDelegate?.myCustomer
        
        if let myDataCount:Int? = myDataReference?.getArrayData().count {
            
         
            if let myDataArray = myDataReference?.getArrayData() {
                
                
                let myDataItem = myDataArray[indexPath.row]
                
                cell.FirstNameLabel.text = "Firstname: \(myDataItem.theFirstName)"
                cell.LastNameLabel.text = "Lastname: \(myDataItem.theLastName)"
                cell.PhoneLabel.text = "Phone: \(myDataItem.thePhone)"
                cell.EmailLabel.text = "Email: \(myDataItem.theEmail)"
                cell.AddressLabel.text = "Address: \(myDataItem.theAddress)"
                cell.CityLabel.text = "City: \(myDataItem.theCity)"
                cell.ZipLabel.text = "Zip: \(myDataItem.theZip)"
                cell.imageview.image = myDataItem.theImage
                
                
                
            }
            
        }
        
        
        
        // Configure the cell...
        
        return cell
    }
}
*/
