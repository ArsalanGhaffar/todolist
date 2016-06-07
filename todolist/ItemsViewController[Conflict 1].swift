//
//  ItemsViewController.swift
//  todolist
//
//  Created by Raza on 02/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{

    var taskstore : taskStore!
    
    
    
    @IBAction func addnewitem(sender:AnyObject){
    
        let newitem = taskstore.taskobj.indexOf(<#T##element: taskModel##taskModel#>)
        
        
//        if let index = taskstore
        
        
        
        
        
        
    
    }
    @IBAction func edititem(sender:AnyObject){
        if editing{
            
            sender.setTitle("Edit", forState: .Normal)
        
            setEditing(false, animated: true)
        
        }else{
        
            sender.setTitle("Done", forState:  .Normal)
            
            setEditing(true, animated: true)
            
        
        }
    
    }
    
    
    
    
    override func viewDidLoad() {
  
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let statusbarheight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusbarheight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskstore.taskobj.count

    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .Normal, reuseIdentifier: "design1")
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//                let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        let item = taskstore.taskobj[indexPath.row]
        cell.textLabel?.text = item.taskName
        cell.detailTextLabel?.text = item.Location
        return cell
        
        
    }
    
//   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//    
//    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
