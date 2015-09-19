//
//  ViewController.swift
//  iBeaconImposter
//
//  Created by Albert Wang on 19/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {

    lazy var peripheraManager: CBPeripheralManager = CBPeripheralManager(delegate:self, queue:nil, options:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startImposter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startImposter() {
        let task = NSUUID()
        let beaconRegion = CLBeaconRegion(proximityUUID: task, identifier: "com.unimelb.publicfloat.yellow")
        let beaconPeripheraData = beaconRegion.peripheralDataWithMeasuredPower(nil)
        peripheraManager = CBPeripheralManager(delegate:self, queue:nil, options:nil)
        peripheraManager.startAdvertising(beaconPeripheraData as [NSObject : AnyObject])
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        NSLog("Did update state.\n")
    }
    
    func peripheralManager(peripheral: CBPeripheralManager!, didReceiveReadRequest request: CBATTRequest!) {
        NSLog("Did receive read request.\n")
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        NSLog("Did start advertising.\n")
    }
}

