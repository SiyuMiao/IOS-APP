// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class TaskDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblCustomer: UILabel!
    
    @IBOutlet weak var lblTaskPriority: UILabel!
    
    @IBOutlet weak var lblTaskType: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblNote: UITextView!
    
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCustomer.text = task.customer
        lblTaskPriority.text = task.taskpriority
        lblTaskType.text = task.tasktype
        lblDate.text = task.date
        lblNote.text = task.note

        // Do any additional setup after loading the view.
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
