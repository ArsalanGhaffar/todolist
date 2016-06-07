//
//  ItemsViewController.swift
//  todolist
//
//  Created by Raza on 02/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import UIKit
import CoreData



class ItemsViewController: UITableViewController{
    
    var taskstore : taskStore!
    var imgstore : ImageStore!
    //     var ctasklist = [NSManagedObjectContext]()
    
    @IBAction func addnewitem(sender:AnyObject){
        let newitem = taskstore.createitem()
        
        if let index = taskstore.taskobj.indexOf(newitem){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    //      code will provide edit uileftbar button for editing with feautres
    required init?(coder aDecoder : NSCoder){
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    
    //    // by storyboard insert button and connect this method
    //    
    //    @IBAction func edititem(sender:UIBarButtonItem){
    //        if editing{
    //            
    ////            sender.setTitle("Edit", forState: .Normal)
    //        
    //            setEditing(false, animated: true)
    //        
    //        }else{
    //        
    ////            sender.setTitle("Done", forState:  .Normal)
    //            
    //            setEditing(true, animated: true)
    //            
    //        
    //        }
    //    
    //    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showtaskmodelitem"{
            // row ??
            if let row = tableView.indexPathForSelectedRow?.row{
                
                let item = taskstore.taskobj[row]
                let detailviewcon = segue.destinationViewController as! detailViewController
                detailviewcon.taskmodel = item
                detailviewcon.imgstore = imgstore
                
                
                
                
                
            }
            
            
            
        }
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        let statusbarheight = UIApplication.sharedApplication().statusBarFrame.height
        //        let insets = UIEdgeInsets(top: statusbarheight, left: 0, bottom: 0, right: 0)
        //        tableView.contentInset = insets
        //        tableView.scrollIndicatorInsets = insets
        //        tableView.rowHeight = 65
        // assgins default height
        tableView.rowHeight = UITableViewAutomaticDimension
        // estimated row height is default value 
        tableView.rowHeight = 65
        
        
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
        // new cell identifier this is tableview default cell, identifier is default in storyboard
        //            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        // this is prototype cell identifier
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! itemCell
        cell.updatecell()
        
        //                let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let item = taskstore.taskobj[indexPath.row]
        //              cell.textLabel?.text = item.taskName
        //              cell.detailTextLabel?.text = item.Location
        cell.vLocation.text = item.Location
        cell.vtaskname.text = item.taskName
        cell.vtaskpriority.text = item.taskpriority
        cell.counter.text = String(indexPath.row + 1)
        
        
        return cell
        
        
    }
    
    //  override  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        return 2
    //    }
    
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Remove"
    }
    
    
    override  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.purpleColor()
        return view
    }
    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.purpleColor()
        return view
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if editingStyle == .Delete {
            
            //            let row = taskstore.taskobj.removeAtIndex(indexPath.row)
            let row = taskstore.taskobj[indexPath.row]
            let title = "Delete \(row.taskName)?"
            let message = "Do you want to delete ?"
            
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
            let delaction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action) -> Void in
                
                self.taskstore.removeitem(row)
                self.imgstore.deleteimageforkey(self.taskstore.taskobj[indexPath.row].itemkey)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                tableView.reloadData()
            })
            
            ac.addAction(cancelAction)
            ac.addAction(delaction)
            presentViewController(ac, animated: true, completion: nil )
            
            
            
        }
        
        
        
    }
    
    
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        taskstore.moveItem(sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
        tableView.reloadData()
        
        
        
        
        
    }
    
    
    
    
}
