// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class NewJobTableViewController: UITableViewController {

    @IBOutlet weak var txtCustomer: UITextField!
    
    @IBOutlet weak var txtJobTitle: UITextField!
    
    @IBOutlet weak var txtJobType: UITextField!
    
    @IBOutlet weak var txtStartTime: UITextField!
    
    @IBOutlet weak var txtEndTime: UITextField!
    
    @IBOutlet weak var txtPrice: UITextField!
    
    @IBOutlet weak var txtTax: UITextField!
    
    @IBOutlet weak var txtNote: UITextView!
    
    var job = Job()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveJobSegue"){
            job.customer = txtCustomer.text
            job.jobtitle = txtJobTitle.text
            job.jobtype = txtJobType.text
            job.starttime = txtStartTime.text
            job.endtime = txtEndTime.text
            job.price = txtPrice.text
            job.tax = txtTax.text
            job.note = txtNote.text
        }
    }

    
}
