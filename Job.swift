// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class Job: NSObject, NSCoding {
    var customer: String = String()
    var jobtitle: String = String()
    var jobtype: String = String()
    var starttime: String = String()
    var endtime: String = String()
    var price: String = String()
    var tax: String = String()
    var note: String = String()
    
    init(
        cust userCustomer:String,
        jobti userJobTitle:String,
        jobty userJobType:String,
        stime userStartTime:String,
        etime userEndTime:String,
        pri userPrice:String,
        ta userTax:String,
        nott userNote:String
        ){
            super.init()
            customer = userCustomer
            jobtitle = userJobTitle
            jobtype = userJobType
            starttime = userStartTime
            endtime = userEndTime
            price = userPrice
            tax = userTax
            note = userNote
    }
    
    override init(){
        super.init()
        customer = "Levi Garner"
        jobtitle = "Test"
        jobtype = "Test"
        starttime = "12-01-2015"
        endtime = "12-03-2015"
        price = "$300"
        tax = "$21"
        note = "Test"
    }
    required convenience init(coder aDecoder: NSCoder){
        self.init()
        customer = aDecoder.decodeObjectForKey("Customer") as! String
        jobtitle = aDecoder.decodeObjectForKey("JobTitle") as! String
        jobtype = aDecoder.decodeObjectForKey("JobType") as! String
        starttime = aDecoder.decodeObjectForKey("StartTime") as! String
        endtime = aDecoder.decodeObjectForKey("EndTime") as! String
        price = aDecoder.decodeObjectForKey("Price") as! String
        tax = aDecoder.decodeObjectForKey("Tax") as! String
        note = aDecoder.decodeObjectForKey("Note") as! String
        
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(customer, forKey: "Customer")
        aCoder.encodeObject(jobtitle, forKey: "JobTitle")
        aCoder.encodeObject(jobtype, forKey: "JobType")
        aCoder.encodeObject(starttime, forKey: "StartTime")
        aCoder.encodeObject(endtime, forKey: "EndTime")
        aCoder.encodeObject(price, forKey: "Price")
        aCoder.encodeObject(tax, forKey: "Tax")
        aCoder.encodeObject(note, forKey: "Note")
    }
    
}
