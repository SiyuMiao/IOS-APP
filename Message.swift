// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class Message: NSObject, NSCoding {
    var customer: String = String()
    var adsources: String = String()
    var messagetype: String = String()
    var phone: String = String()
    var appointdate: String = String()
    var start: String = String()
    var end: String = String()
    var note: String = String()
    
    init(
        cu userCustomer:String,
        ad userAdsources:String,
        mes userMessageType:String,
        phon userPhone:String,
        app userAppointDate:String,
        sta userStart:String,
        en userEnd:String,
        not userNote:String
        ){
            super.init()
            customer = userCustomer
            adsources = userAdsources
            messagetype = userMessageType
            phone = userPhone
            appointdate = userAppointDate
            start = userStart
            end = userEnd
            note = userNote
    }
    override init(){
        super.init()
        customer = "Siyu Miao"
        adsources = "Test"
        messagetype = "Test"
        phone = "1234567890"
        appointdate = "12-02-2015"
        start = "5:00 AM"
        end = "13:00 PM"
        note = "Test"
    }
    required convenience init(coder aDecoder: NSCoder){
        self.init()
        customer = aDecoder.decodeObjectForKey("Customer") as! String
        adsources = aDecoder.decodeObjectForKey("Adsources") as! String
        messagetype = aDecoder.decodeObjectForKey("MessageType") as! String
        phone = aDecoder.decodeObjectForKey("Phone") as! String
        appointdate = aDecoder.decodeObjectForKey("AppointDate") as! String
        start = aDecoder.decodeObjectForKey("Start") as! String
        end = aDecoder.decodeObjectForKey("End") as! String
        note = aDecoder.decodeObjectForKey("Note") as! String
    
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(customer, forKey: "Customer")
        aCoder.encodeObject(adsources, forKey: "Adsources")
        aCoder.encodeObject(messagetype, forKey: "MessageType")
        aCoder.encodeObject(phone, forKey: "Phone")
        aCoder.encodeObject(appointdate, forKey: "AppointDate")
        aCoder.encodeObject(start, forKey: "Start")
        aCoder.encodeObject(end, forKey: "End")
        aCoder.encodeObject(note, forKey: "Note")
    
}
}