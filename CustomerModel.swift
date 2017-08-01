// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015
/*
import UIKit
var FirstNames = ["Siyu","Levi","Varsha"]
var LastNames = ["Miao","Garner","Vadaga"]
var Phones = ["1234567890","0987654321","1111222233"]
var Emails = ["siyu@test.com","levi@test.com","varsha@test.com"]
var Addresses = ["2170 E TEST Dr","1139 N TEST Dr","6718 S TEST Dr"]
var Citys = ["Bloomington","Bloomington","Bloomington"]
var Zips = ["47401","47402","47403"]
var images = [UIImage(named: "cat.jpeg")!,UIImage(named: "dog.jpeg")!,UIImage(named: "rabbit.jpeg")!]

class Item: NSObject {
    
    var theFirstName: String
    var theLastName: String
    var thePhone: String
    var theEmail: String
    var theAddress: String
    var theCity: String
    var theZip: String
    var theImage: UIImage
    
    
    init (
        cFirstNames: String,
        cLastNames: String,
        cPhones: String,
        cEmails: String,
        cAddresses: String,
        cCitys: String,
        cZips: String,
        cImage:UIImage) {
            theFirstName = cFirstNames
            theLastName = cLastNames
            thePhone = cPhones
            theEmail = cEmails
            theAddress = cAddresses
            theCity = cCitys
            theZip = cZips
            theImage = cImage
    }
    
}
var myTest: [Item]  = [Item(
    cFirstNames:"I399",
    cLastNames:"Team10",
    cPhones:"6666666666",
    cEmails:"team10@test.com",
    cAddresses:"111E LH030",
    cCitys:"Bloomington",
    cZips:"47401",
    cImage: UIImage(named: "rabbit.jpeg")!)]

class CustomerModel: NSObject {
    func createView() {
        for var i=0; i<FirstNames.count; i++ {
            
            self.addCustomer(FirstNames[i], Lastname: LastNames[i], Phone: Phones[i], Email: Emails[i], Address:Addresses[i], City:Citys[i], Zip:Zips[i], theImage: images[i])
        }
        
    }
    func addCustomer(
        Firstname: String,
        Lastname: String,
        Phone: String,
        Email: String,
        Address:String,
        City:String,
        Zip:String,
        theImage: UIImage
        ) {
            
            myTest.append(
                Item(
                    cFirstNames: Firstname,
                    cLastNames: Lastname,
                    cPhones: Phone,
                    cEmails: Email,
                    cAddresses: Address,
                    cCitys: City,
                    cZips: Zip,
                    cImage: theImage)
            )
    }
    
    func getArrayData() -> [Item] {
        return myTest
    }
    
    func getFirstItemCategory() -> String {
        return myTest[0].theZip
    }
    
    func getLastItemCategory() -> String {
        return myTest[(myTest.count)-1].theZip
    }
    
}

*/
