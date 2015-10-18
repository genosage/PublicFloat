//
//  TestBeaconViewController.swift
//  PublicFloat
//
//  Created by 张添 on 18/10/2015.
//  Copyright © 2015 YellowTeam. All rights reserved.
//

import Foundation
import UIKit

class TestBeaconViewController: UIViewController,ESTBeaconManagerDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "8492E75F-4FD6-469D-B132-043FE94921D8")!,
        identifier: "ranged region")
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        label.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if label.text != String(beacons.count){
            label.text = String(beacons.count)
            textView.text = ""
            for i in beacons{
                textView.text.appendContentsOf(i.description)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}