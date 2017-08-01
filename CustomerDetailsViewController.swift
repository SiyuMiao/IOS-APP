// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015
/*
import UIKit

class CustomerDetailsViewController: UIViewController {
    
    @IBOutlet weak var editHonorificTextField: UITextField!
    
    @IBOutlet weak var editFirstNameTextField: UITextField!
    
    @IBOutlet weak var editLastNameTextField: UITextField!
    
    @IBOutlet weak var editPhone1TextField: UITextField!
    
    @IBOutlet weak var editPhone2TextField: UITextField!
    
    @IBOutlet weak var editEmailTextField: UITextField!
    
    @IBOutlet weak var editAddressTextField: UITextField!
    
    @IBOutlet weak var editCityTextField: UITextField!
    
    @IBOutlet weak var editZipTextField: UITextField!
    
    @IBOutlet weak var editStateTextField: UITextField!
    
    @IBOutlet weak var editNoteTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
    }
    
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let CustomerHonorific = editHonorificTextField.text;
        let CustomerFirstName = editFirstNameTextField.text;
        let CustomerLastName = editLastNameTextField.text;
        let CustomerPhone1 = editPhone1TextField.text;
        let CustomerPhone2 = editPhone2TextField.text;
        let CustomerEmail = editEmailTextField.text;
        let CustomerAddress = editAddressTextField.text;
        let CustomerCity = editCityTextField.text;
        let CustomerZip = editZipTextField.text;
        let CustomerState = editStateTextField.text;
        
        
        if (CustomerHonorific.isEmpty || CustomerFirstName.isEmpty || CustomerLastName.isEmpty || CustomerPhone1.isEmpty || CustomerEmail.isEmpty || CustomerAddress.isEmpty || CustomerCity.isEmpty || CustomerZip.isEmpty || CustomerState.isEmpty)
        {
            displayMyAlertMessage("You need to fill out all the fields!");
            return;
        }
        
        
        let myUrl = NSURL(string:"http://www.amarasite.com/CompanyPro/Customer_Save.php");
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
*/