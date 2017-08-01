// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class MessageDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblCustomer: UILabel!
    
    @IBOutlet weak var lblAdsources: UILabel!
    
    @IBOutlet weak var lblMessageType: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblAppointDate: UILabel!
    
    @IBOutlet weak var lblStart: UILabel!
    
    @IBOutlet weak var lblEnd: UILabel!
    
    @IBOutlet weak var lblNote: UITextView!
    
    var message = Message()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblCustomer.text = message.customer
        lblAdsources.text = message.adsources
        lblMessageType.text = message.messagetype
        lblPhone.text = message.phone
        lblAppointDate.text = message.appointdate
        lblStart.text = message.start
        lblEnd.text = message.end
        lblNote.text = message.note
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
