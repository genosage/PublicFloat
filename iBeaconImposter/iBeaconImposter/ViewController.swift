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
        let beaconRegion = CLBeaconRegion(proximityUUID: task, major: 1, minor: 1, identifier: "com.unimelb.publicfloat.yellow")
        //CLBeaconRegion(proximityUUID: task, identifier: "com.unimelb.publicfloat.yellow")
        let beaconPeripheraData = beaconRegion.peripheralDataWithMeasuredPower(nil)
        peripheraManager = CBPeripheralManager(delegate:self, queue:nil, options:nil)
        let data = NSDictionary(dictionary: beaconPeripheraData)
        peripheraManager.startAdvertising((data as! [String : AnyObject]))
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
        if (peripheral.state == CBPeripheralManagerState.PoweredOn) {
                NSLog("Did update state power on.\n")
        }
        else if (peripheral.state == CBPeripheralManagerState.PoweredOff) {
                 NSLog("Did update state power off.\n")
        }
        else if(peripheral.state == CBPeripheralManagerState.Unauthorized) {
                 NSLog("Did update state unauthorized.\n")
        }
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didReceiveReadRequest request: CBATTRequest) {
        NSLog("Did receive read request.\n")
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
        NSLog("Did start advertising.\n")
    }
}

