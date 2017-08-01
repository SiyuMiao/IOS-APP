// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class NewMessageTableViewController: UITableViewController {
    
    @IBOutlet weak var txtCustomer: UITextField!
    
    @IBOutlet weak var txtAdsources: UITextField!
    
    @IBOutlet weak var txtMessageType: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtAppointDate: UITextField!
    
    @IBOutlet weak var txtStart: UITextField!
    
    @IBOutlet weak var txtEnd: UITextField!
    
    @IBOutlet weak var txtNote: UITextView!
    
    var message = Message()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveMessageSegue"){
            message.customer = txtCustomer.text
            message.adsources = txtAdsources.text
            message.messagetype = txtMessageType.text
            message.phone = txtPhone.text
            message.appointdate = txtAppointDate.text
            message.start = txtStart.text
            message.end = txtEnd.text
            message.note = txtNote.text
            
            
        }

    }

}
