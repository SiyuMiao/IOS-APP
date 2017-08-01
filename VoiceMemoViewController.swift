// Project app name: Customer Pro
// Siyu Miao  siyumiao@indiana.edu
// Levi Garner legarner@umail.iu.edu
// "Final Project"
// "I399 / Fall 2015"
// 12/15/2015

import UIKit
import AVFoundation
import CoreLocation
import MapKit

class VoiceMemoViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    
    
    @IBOutlet var PlayBTN: UIButton!
    @IBOutlet var RecordBTN: UIButton!
    
    
    var soundRecorder : AVAudioRecorder!
    var SoundPlayer : AVAudioPlayer!
    var locationManager = CLLocationManager()
    
    var fileName = "audioFile.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupRecorder()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupRecorder(){
        
        
        var recordSettings = [AVFormatIDKey : kAudioFormatAppleLossless,
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0 ]
        
        var error : NSError?
        
        soundRecorder = AVAudioRecorder(URL: getFileURL(), settings: recordSettings as [NSObject : AnyObject], error: &error)
        
        if let err = error{
            
            NSLog("SOmething Wrong")
        }
            
        else {
            
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
            
        }
        
    }
    
    
    
    
    func getCacheDirectory() -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as! [String]
        
        return paths[0]
        
    }
    
    func getFileURL() -> NSURL{
        let path  = getCacheDirectory().stringByAppendingPathComponent(fileName)
        
        let filePath = NSURL(fileURLWithPath: path)
        
        return filePath!
    }
    
    
    @IBAction func Record(sender: UIButton) {
        
        if sender.titleLabel?.text == "Record"{
            
            soundRecorder.record()
            sender.setTitle("Stop", forState: .Normal)
            PlayBTN.enabled = false
            
        }
        else{
            
            soundRecorder.stop()
            sender.setTitle("Record", forState: .Normal)
            PlayBTN.enabled = false
        }
        
    }
    
    @IBAction func PlaySound(sender: UIButton) {
        
        if sender.titleLabel?.text == "Play" {
            
            RecordBTN.enabled == false
            sender.setTitle("Stop", forState: .Normal)
            
            preparePlayer()
            SoundPlayer.play()
            
        }
        else{
            
            SoundPlayer.stop()
            sender.setTitle("Play", forState: .Normal)
            
        }
        
    }
    
    func preparePlayer(){
        
        var error : NSError?
        SoundPlayer = AVAudioPlayer(contentsOfURL: getFileURL(), error: &error)
        
        if let err = error{
            
            NSLog("sjkaldfhjakds")
        }
        else{
            
            SoundPlayer.delegate = self
            SoundPlayer.prepareToPlay()
            SoundPlayer.volume = 1.0
        }
        
    }
    
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        PlayBTN.enabled = true
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        RecordBTN.enabled = true
        PlayBTN.setTitle("Play", forState: .Normal)
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation: CLLocation = locations[0] as! CLLocation
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegion(center: location, span:span)
        myMap.setRegion(region, animated: true)
        
    }
    
}

