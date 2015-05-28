//
//  ViewController.swift
//  Dry Fire Timer
//
//  Created by Adam Lowther on 5/28/15.
//  Copyright (c) 2015 Lowther. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var startStopButton: UIButton!

//    var isStopped = false
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startStopButton.setTitle("Start", forState: UIControlState.Normal)
        self.startStopButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.startStopButton.layer.cornerRadius = 0.5 * self.startStopButton.bounds.size.width
        self.startStopButton.backgroundColor = UIColor.greenColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startStopButtonPressed(sender: AnyObject) {
        self.startStopButton.setTitle("Standby", forState: UIControlState.Normal)
        self.startStopButton.backgroundColor = UIColor.blueColor()
        self.startStopButton.userInteractionEnabled = false
        self.randomTimerFireBuzzer()
        
//        self.isStopped = !self.isStopped
    }
    
    func randomTimerFireBuzzer() {
        let mini = UInt32(2)
        let maxi = UInt32(4)
            
        let delay = Double(mini + arc4random_uniform(maxi - mini))
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("soundBuzzer"), userInfo: nil, repeats: false)
        var buzzerSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Glass", ofType: "aiff")!)
//        var audioPlayer = AVAudioPlayer()
        audioPlayer = AVAudioPlayer(contentsOfURL: buzzerSound, error: nil)
        audioPlayer.prepareToPlay()
    }
    
    func soundBuzzer() {
        audioPlayer.play()
        
        self.startStopButton.setTitle("Start", forState: UIControlState.Normal)
        self.startStopButton.backgroundColor = UIColor.greenColor()
        self.startStopButton.userInteractionEnabled = true
    }
}

