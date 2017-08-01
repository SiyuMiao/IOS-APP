// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        if(userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty)
        {
            displayMyAlertMessage("You need to fill out all the fields!");
            
            return;
        }
        if(userPassword != userRepeatPassword)
        {
            displayMyAlertMessage("Passwords do not match!");
            
            return;
        }
        
        
        let myUrl = NSURL(string:"http://www.amarasite.com/CompanyPro/Register.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmail)&password=\(userPassword)";
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
        
        //NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        //NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        //NSUserDefaults.standardUserDefaults().synchronize();
        
        //var myAlert = UIAlertController(title:"Alert", message:"Registration is succesful! Thank you!", preferredStyle:UIAlertControllerStyle.Alert);
        
        //let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){
            //action in self.dismissViewControllerAnimated(true, completion:nil)}
        //myAlert.addAction(okAction);
        //self.presentViewController(myAlert, animated:true, completion:nil);
        }
}