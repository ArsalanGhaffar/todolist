//
//  model.swift
//  todolist
//
//  Created by Raza on 02/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//


import UIKit
public class taskModel : NSObject {
  
    var taskName    : String    = ""
    var Location    : String    = ""
    var taskpriority: String    = ""
    var time        : NSDate
    let itemkey     : String
    
    
    
    
    
    init(taskName:String, Location:String, taskpriority:String){
        self.taskName = taskName
        self.Location = Location
        self.taskpriority = taskpriority
        self.time = NSDate()
        itemkey = NSUUID().UUIDString
        super.init()
    
    
    
    }




}