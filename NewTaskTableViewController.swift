// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class NewTaskTableViewController: UITableViewController {
    
    @IBOutlet weak var txtCustomer: UITextField!
    
    @IBOutlet weak var txtTaskPriority: UITextField!
    
    @IBOutlet weak var txtTaskType: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtNote: UITextView!
    
    var task = Task()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveTaskSegue"){
            task.customer = txtCustomer.text
            task.taskpriority = txtTaskPriority.text
            task.tasktype = txtTaskType.text
            task.date = txtDate.text
            task.note = txtNote.text
            
        }
    }


}
