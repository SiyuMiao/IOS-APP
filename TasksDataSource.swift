// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class TasksDataSource: NSObject {
    var tasks = NSMutableArray()
    override init(){
        super.init()
        loadTasks()
    }
    func countOfTasks() -> Int {
        return tasks.count
    }
    
    func taskAtIndex(taskIndex index:Int) -> Task {
        return tasks.objectAtIndex(index) as! Task
    }
    
    func addTask(task newTask: Task){
        tasks.addObject(newTask)
        saveTasks()
    }
    
    func deleteTask(index:Int){
        tasks.removeObjectAtIndex(index)
        saveTasks()
    }
    
    func moveTask(from fromIndex: Int, to toIndex: Int){
        let taskFrom = taskAtIndex(taskIndex: fromIndex)
        let taskTo = taskAtIndex(taskIndex: toIndex)
        tasks.replaceObjectAtIndex(fromIndex, withObject: taskTo)
        tasks.replaceObjectAtIndex(toIndex, withObject: taskFrom)
        saveTasks()
    }
    func getFileURL () -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let taskDirc = fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)!
        let fileURL = taskDirc.URLByAppendingPathComponent("newTask.data")
        return fileURL
    }
    func saveTasks (){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(tasks, toFile: fileURL.path!)
    }
    func loadTasks (){
        let fileURL = getFileURL()
        if (NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)){
            let tasks = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as! NSArray
            //tasks.addObjectsFromArray(tasks as [AnyObject])
        }else {
            let sampleTask = Task()
            tasks.addObject(sampleTask)
            saveTasks()
        }
    }
}
