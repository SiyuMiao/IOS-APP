// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class MessagesDataSource: NSObject {
    var messages = NSMutableArray()
    override init(){
        super.init()
        loadMessages()
    }
    func countOfMessages() -> Int {
        return messages.count
    }
    
    func messageAtIndex(messageIndex index:Int) -> Message {
        return messages.objectAtIndex(index) as! Message
    }
    
    func addMessage(message newMessage: Message){
        messages.addObject(newMessage)
        saveMessages()
    }
    
    func deleteMessage(index:Int){
        messages.removeObjectAtIndex(index)
        saveMessages()
    }
    
    func moveMessage(from fromIndex: Int, to toIndex: Int){
        let messageFrom = messageAtIndex(messageIndex: fromIndex)
        let messageTo = messageAtIndex(messageIndex: toIndex)
        messages.replaceObjectAtIndex(fromIndex, withObject: messageTo)
        messages.replaceObjectAtIndex(toIndex, withObject: messageFrom)
        saveMessages()
    }
    func getFileURL () -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let messageDir = fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)!
        let fileURL = messageDir.URLByAppendingPathComponent("newMessage.data")
        return fileURL
    }
    func saveMessages (){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(messages, toFile: fileURL.path!)
    }
    func loadMessages (){
        let fileURL = getFileURL()
        if (NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)){
            let messages = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as! NSArray
            //messages.addObjectsFromArray(messages as [AnyObject])
        }else {
            let sampleMessage = Message()
            messages.addObject(sampleMessage)
            saveMessages()
        }
    }

}
