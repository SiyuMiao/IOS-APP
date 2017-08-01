// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTestField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject){
        let userEmail = userEmailTextField.text;
        
        let userPassword = userPasswordTestField.text;
        
        if(userPassword.isEmpty || userPassword.isEmpty) {return;}
        
        let myUrl = NSURL(string:"http://www.amarasite.com/CompanyPro/Login.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmail)&password=\(userPassword)";
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            if error != nil{
                println("error=\(error)")
                return
            }
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
            
            if let parseJSON = json {
                var resultValue:String = parseJSON["status"] as! String!;
                println("result: \(resultValue)")
                
                if(resultValue=="Success"){
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey:"isUserLoggedIn");
                    NSUserDefaults.standardUserDefaults().synchronize();
                    self.dismissViewControllerAnimated(true, completion:nil);
                }
            }
        }
        task.resume()
        }
}
        
        
        
        //let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        //let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        //if(userEmailStored == userEmail){
            //if(userPasswordStored == userPassword){
                //NSUserDefaults.standardUserDefaults().setBool(true, forKey:"isUserLoggedIn");
                //NSUserDefaults.standardUserDefaults().synchronize();
                //self.dismissViewControllerAnimated(true, completion:nil);
            //}
        //}