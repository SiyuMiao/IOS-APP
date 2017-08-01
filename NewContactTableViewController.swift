// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class NewContactTableViewController: UITableViewController {

    @IBOutlet weak var txtHonorific: UITextField!
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtPhone1: UITextField!
    
    @IBOutlet weak var txtPhone2: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtZip: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtState: UITextField!
    
    @IBOutlet weak var txtNote: UITextField!
    
    
    var contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveSegue"){
            contact.honorific = txtHonorific.text
            contact.firstname = txtFirstName.text
            contact.lastname = txtLastName.text
            contact.phone1 = txtPhone1.text
            contact.phone2 = txtPhone2.text
            contact.emailAddress = txtEmail.text
            contact.address = txtAddress.text
            contact.zip = txtZip.text
            contact.city = txtCity.text
            contact.state = txtState.text
            contact.note = txtNote.text
        }
    }
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
    }
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let CustomerHonorific = txtHonorific.text;
        let CustomerFirstName = txtFirstName.text;
        let CustomerLastName = txtLastName.text;
        let CustomerPhone1 = txtPhone1.text;
        let CustomerPhone2 = txtPhone2.text;
        let CustomerEmail = txtEmail.text;
        let CustomerAddress = txtAddress.text;
        let CustomerZip = txtZip.text;
        let CustomerCity = txtCity.text;
        let CustomerState = txtState.text;
        let CustomerNote = txtNote.text;
        
        
        if (CustomerHonorific.isEmpty || CustomerFirstName.isEmpty || CustomerLastName.isEmpty || CustomerPhone1.isEmpty || CustomerEmail.isEmpty || CustomerAddress.isEmpty || CustomerCity.isEmpty || CustomerZip.isEmpty || CustomerState.isEmpty)
        {
            displayMyAlertMessage("You need to fill out all the fields!");
            return;
        }
        
        
        let myUrl = NSURL(string:"http://www.amarasite.com/CompanyPro/Customers_Grid_Load.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "Honorific=\(CustomerHonorific)&FirstName=\(CustomerFirstName)&LastName=\(CustomerLastName)&Phone1=\(CustomerPhone1)&Phone2=\(CustomerPhone1)&Email=\(CustomerEmail)&Address=\(CustomerAddress)&City=\(CustomerCity)&Zip=\(CustomerZip)&State=\(CustomerState)";
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            if error != nil {
                println("error=\(error)")
                return
            }
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
            
            
            if let parseJSON = json {
                var resultValue = parseJSON["status"] as? String
                println("result:\(resultValue)")
                
                var isUserRegistered:Bool = false;
                if(resultValue=="Success") {isUserRegistered = true;}
                
                var messageToDisplay:String = parseJSON["message"] as! String!;
                if(!isUserRegistered){
                    messageToDisplay = parseJSON["message"]as! String!;
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    var myAlert = UIAlertController(title:"Alert", message: messageToDisplay, preferredStyle:UIAlertControllerStyle.Alert);
                    let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){
                        action in self.dismissViewControllerAnimated(true, completion:nil);
                    }
                    
                    myAlert.addAction(okAction);
                    self.presentViewController(myAlert, animated:true, completion:nil);
                });
            }
        }
        task.resume()
    }



    
    
    

}
