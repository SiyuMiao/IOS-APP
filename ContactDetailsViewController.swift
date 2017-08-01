// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var lblHonorific: UILabel!
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblPhone1: UILabel!
    
    @IBOutlet weak var lblPhone2: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblZip: UILabel!
    
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblState: UILabel!
    
    @IBOutlet weak var lblNote: UITextView!
    
    var contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHonorific.text = contact.honorific
        lblFirstName.text = contact.firstname
        lblLastName.text = contact.lastname
        lblPhone1.text = contact.phone1
        lblPhone2.text = contact.phone2
        lblEmail.text = contact.emailAddress
        lblAddress.text = contact.address
        lblZip.text = contact.zip
        lblCity.text = contact.city
        lblState.text = contact.state
        lblNote.text = contact.note
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
