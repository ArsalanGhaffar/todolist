//
//  taskStore.swift
//  todolist
//
//  Created by Arsalan on 5/2/16.
//  Copyright © 2016 PanaCloud. All rights reserved.
//



class taskStore{
    
    let coreDataStack = CoreDataStack(modelName: "Imgntabledata")

    var taskobj = [taskModel]()
    
    func createitem()-> taskModel{
        
        let task1 = taskModel(taskName: "shoping", Location: "Karachi",taskpriority: "Moderate")
        taskobj.append(task1)
        return task1
            }
    

    
    func removeitem(delrow:taskModel){
        
        if let index = taskobj.indexOf(delrow) {
            taskobj.removeAtIndex(index)
        }
        
        
    }

    
    func moveItem(fromIndex:Int, toIndex:Int){
        if fromIndex == toIndex {return}
        
        let a = taskobj[fromIndex]
        taskobj.removeAtIndex(fromIndex)
        taskobj.insert(a, atIndex: toIndex)
        
    }
    







}