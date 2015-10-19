//
//  TestBeaconViewController.swift
//  PublicFloat
//
//  Created by 张添 on 18/10/2015.
//  Copyright © 2015 YellowTeam. All rights reserved.
//

import Foundation
import UIKit

var artwork = [("Col du Galibier","Bush_Col_du_Galibier_1",1234),("the great went","Bush_My_name_is_the_great_went_1",3059)]

class TestBeaconViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ESTBeaconManagerDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "8492E75F-4FD6-469D-B132-043FE94921D8")!,
        identifier: "ranged region")
    var beacon : [CLBeacon] = []
    
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
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return beacon.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = table.dequeueReusableCellWithIdentifier("beaconCell")! as UITableViewCell
        
        var image = cell.viewWithTag(101) as! UIImageView
        var title = cell.viewWithTag(102) as! UILabel
        
        image.image = UIImage(named: artwork[indexPath.row].1)
        title.text = artwork[indexPath.row].0
        
        return cell
        
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        beacon = beacons
        if beacons.count != 0{
            if Int((beacons.first!.major)) != artwork[0].2{
                let art = artwork[0]
                artwork[0] = artwork[1]
                artwork[1] = art
            }
        }
        table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}