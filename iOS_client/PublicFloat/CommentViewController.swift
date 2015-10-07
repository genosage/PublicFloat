//
//  ViewController.swift
//  Test1
//
//  Created by chaizheng on 15/10/3.
//  Copyright (c) 2015年 chaizheng. All rights reserved.
//

import UIKit

class CommentViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView1: UITableView!

    @IBOutlet var comments: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.dataSource = self
        tableView1.delegate = self
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "pull to refresh")
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        //NSLog("12345")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 13
        //4 comments 16
    }
    
    func refresh(){
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "nstimerrefresh", userInfo: nil, repeats: false)
        
    }
    
    func nstimerrefresh(){
        
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    
    @IBAction func endEdit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        NSLog("123456")
        var cellId = "chaicell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        //cell?.imageView?.image = UIImage(named:"pic1")
        NSLog("123")
        cell?.textLabel?.text = "comments:\(comments.text) "
        // NSLog(comments.text)
        //cell?.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        //cell?.accessoryType = UITableViewCellAccessoryType.DetailButton
        if(indexPath.row%2 == 0){
            return cell!
        }
        else{
            cell?.backgroundColor = UIColor.grayColor()
            return cell!
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

