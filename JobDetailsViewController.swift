// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class JobDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblCustomer: UILabel!

    @IBOutlet weak var lblJobTitle: UILabel!
    
    @IBOutlet weak var lblJobType: UILabel!
    
    @IBOutlet weak var lblStartTime: UILabel!
    
    @IBOutlet weak var lblEndTime: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblTax: UILabel!
    
    @IBOutlet weak var lblNote: UITextView!
    
    var job = Job()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCustomer.text = job.customer
        lblJobTitle.text = job.jobtitle
        lblJobType.text = job.jobtype
        lblStartTime.text = job.starttime
        lblEndTime.text = job.endtime
        lblPrice.text = job.price
        lblTax.text = job.tax
        lblNote.text = job.note
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    }
