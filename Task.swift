// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit
class Task: NSObject, NSCoding {
    var customer: String = String()
    var taskpriority: String = String()
    var tasktype:String = String()
    var date: String = String()
    var note: String = String()
    
    
    init(
        cus userCustomer:String,
        tp userTaskPriority:String,
        tt userTaskType:String,
        da userDate:String,
        no userNote:String
        ){
            super.init()
            customer = userCustomer
            taskpriority = userTaskPriority
            tasktype = userTaskType
            date = userDate
            note = userNote
    }
    override init(){
        super.init()
        customer = "Levi Garner"
        taskpriority = "High"
        tasktype = "Errands"
        date = "12/03/2015"
        note = "Pick up cleaning supplies"
    }
    required convenience init(coder aDecoder: NSCoder){
        self.init()
        customer = aDecoder.decodeObjectForKey("Customer") as! String
        taskpriority = aDecoder.decodeObjectForKey("TaskPriority") as! String
        tasktype = aDecoder.decodeObjectForKey("TaskType") as! String
        date = aDecoder.decodeObjectForKey("Date") as! String
        note = aDecoder.decodeObjectForKey("Note") as! String
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(customer, forKey: "Customer")
        aCoder.encodeObject(taskpriority, forKey: "TaskPriority")
        aCoder.encodeObject(tasktype, forKey: "TaskType")
        aCoder.encodeObject(date, forKey: "Date")
        aCoder.encodeObject(note, forKey: "Note")
        
    }

}
