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
        let task = UUID()
        let beaconRegion = CLBeaconRegion(proximityUUID: task, major: 1, minor: 1, identifier: "com.unimelb.publicfloat.yellow")
        //CLBeaconRegion(proximityUUID: task, identifier: "com.unimelb.publicfloat.yellow")
        let beaconPeripheraData = beaconRegion.peripheralData(withMeasuredPower: nil)
        peripheraManager = CBPeripheralManager(delegate:self, queue:nil, options:nil)
        let data = NSDictionary(dictionary: beaconPeripheraData)
        peripheraManager.startAdvertising((data as! [String : AnyObject]))
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if (peripheral.state == CBPeripheralManagerState.poweredOn) {
                NSLog("Did update state power on.\n")
        }
        else if (peripheral.state == CBPeripheralManagerState.poweredOff) {
                 NSLog("Did update state power off.\n")
        }
        else if(peripheral.state == CBPeripheralManagerState.unauthorized) {
                 NSLog("Did update state unauthorized.\n")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        NSLog("Did receive read request.\n")
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        NSLog("Did start advertising.\n")
    }
}

