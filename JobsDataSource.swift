// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit

class JobsDataSource: NSObject {
    var jobs = NSMutableArray()
    override init(){
        super.init()
        //let sampleContact = Contact()
        //contacts.addObject(sampleContact)
        loadJobs()
    }
    func countOfJobs() -> Int {
        return jobs.count
    }
    
    func jobAtIndex(jobIndex index:Int) -> Job {
        return jobs.objectAtIndex(index) as! Job
    }
    
    func addJob(job newJob: Job){
        jobs.addObject(newJob)
        saveJobs()
    }
    
    func deleteJob(index:Int){
        jobs.removeObjectAtIndex(index)
        saveJobs()
    }
    
    func moveJob(from fromIndex: Int, to toIndex: Int){
        let jobFrom = jobAtIndex(jobIndex: fromIndex)
        let jobTo = jobAtIndex(jobIndex: toIndex)
        jobs.replaceObjectAtIndex(fromIndex, withObject: jobTo)
        jobs.replaceObjectAtIndex(toIndex, withObject: jobFrom)
        saveJobs()
    }
    func getFileURL () -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let jobDir = fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)!
        let fileURL = jobDir.URLByAppendingPathComponent("newJob.data")
        return fileURL
    }
    func saveJobs (){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(jobs, toFile: fileURL.path!)
    }
    func loadJobs (){
        let fileURL = getFileURL()
        if (NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)){
            let jobs = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as! NSArray
            //jobs.addObjectsFromArray(jobs as [AnyObject])
        }else {
            let sampleJob = Job()
            jobs.addObject(sampleJob)
            saveJobs()
        }
    }
   
}
