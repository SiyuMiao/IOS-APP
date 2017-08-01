// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class ContactsDataSource: NSObject {
   var contacts = NSMutableArray()
    override init(){
        super.init()
        //let sampleContact = Contact()
        //contacts.addObject(sampleContact)
        loadContacts()
    }
    func countOfContacts() -> Int {
        return contacts.count
    }
    
    func contactAtIndex(contactIndex index:Int) -> Contact {
        return contacts.objectAtIndex(index) as! Contact
    }
    
    func addContact(contact newContact: Contact){
        contacts.addObject(newContact)
        saveContacts()
    }
    
    func deleteContact(index:Int){
        contacts.removeObjectAtIndex(index)
        saveContacts()
    }
    
    func moveContact(from fromIndex: Int, to toIndex: Int){
        let contactFrom = contactAtIndex(contactIndex: fromIndex)
        let contactTo = contactAtIndex(contactIndex: toIndex)
        contacts.replaceObjectAtIndex(fromIndex, withObject: contactTo)
        contacts.replaceObjectAtIndex(toIndex, withObject: contactFrom)
        saveContacts()
    }
    func getFileURL () -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let homeDir = fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)!
        let fileURL = homeDir.URLByAppendingPathComponent("newContact.data")
        return fileURL
    }
    func saveContacts (){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: fileURL.path!)
    }
    func loadContacts (){
        let fileURL = getFileURL()
        if (NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)){
            let contents = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as! NSArray
            contacts.addObjectsFromArray(contents as [AnyObject])
        }else {
            let sampleContact = Contact()
            contacts.addObject(sampleContact)
            saveContacts()
        }
    }
}
