//
//  taskStore.swift
//  todolist
//
//  Created by Arsalan on 5/2/16.
//  Copyright © 2016 PanaCloud. All rights reserved.
//



class taskStore{

    var taskobj = [taskModel]()
    
    func createitem()-> taskModel{
        
        let task1 = taskModel(taskName: "", Location: "",taskpriority: "")
        taskobj.append(task1)
    
    
        return task1
    
    
    
    
    }
    

    








}