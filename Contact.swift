// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class Contact: NSObject, NSCoding {
    var honorific: String = String()
    var firstname: String = String()
    var lastname: String = String()
    var phone1: String = String()
    var phone2: String = String()
    var emailAddress = ""
    var address = ""
    var zip: String = String()
    var city: String = String()
    var state: String = String()
    var note: String = String()
    
    init(
        hono userHonorific:String,
        first userFirstName:String,
        last userLastName:String,
        p1 userPhone1:String,
        p2 userPhone2:String,
        email userEmailAddress:String,
        add userAddress:String,
        zipcode userZip:String,
        cities userCity:String,
        states userState:String,
        notes userNote:String)
    {
        super.init()
        honorific = userHonorific
        firstname = userFirstName
        lastname = userLastName
        phone1 = userPhone1
        phone2 = userPhone2
        emailAddress = userEmailAddress
        address = userAddress
        zip = userZip
        city = userCity
        state = userState
        note = userNote
    }
    override init(){
        super.init()
        honorific = "Mr"
        firstname = "Siyu"
        lastname = "Miao"
        phone1 = "8126065161"
        phone2 = "8126066457"
        emailAddress = "test@test.com"
        address = "2601E Cargill Dr"
        zip = "47401"
        city = "Bloomington"
        state = "IN"
        note = "test test test test"
    }
    required convenience init(coder aDecoder: NSCoder){
        self.init()
        honorific = aDecoder.decodeObjectForKey("Honorific") as! String
        firstname = aDecoder.decodeObjectForKey("FirstName") as! String
        lastname = aDecoder.decodeObjectForKey("LastName") as! String
        phone1 = aDecoder.decodeObjectForKey("Phone1") as! String
        phone2 = aDecoder.decodeObjectForKey("Phone2") as! String
        emailAddress = aDecoder.decodeObjectForKey("Email") as! String
        address = aDecoder.decodeObjectForKey("Address") as! String
        zip = aDecoder.decodeObjectForKey("Zip") as! String
        city = aDecoder.decodeObjectForKey("City") as! String
        state = aDecoder.decodeObjectForKey("State") as! String
        note = aDecoder.decodeObjectForKey("Note") as! String
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(honorific, forKey: "Honorific")
        aCoder.encodeObject(firstname, forKey: "FirstName")
        aCoder.encodeObject(lastname, forKey: "LastName")
        aCoder.encodeObject(phone1, forKey: "Phone1")
        aCoder.encodeObject(phone2, forKey: "Phone2")
        aCoder.encodeObject(emailAddress, forKey: "Email")
        aCoder.encodeObject(address, forKey: "Address")
        aCoder.encodeObject(zip, forKey: "Zip")
        aCoder.encodeObject(city, forKey: "City")
        aCoder.encodeObject(state, forKey: "State")
        aCoder.encodeObject(note, forKey: "Note")
    }
}
