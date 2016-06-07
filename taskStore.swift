//
//  taskStore.swift
//  todolist
//
//  Created by Raza on 02/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

class taskStore{
var allitems = [taskModel]()
    
    
    func additem(){
    
        var item = taskModel(taskName: "makeApp", Location: "karachi")
        var item2 = taskModel(taskName: "makeApp2", Location: "karachi2")

       allitems.append(item)
        allitems.append(item2)
    
    
    
    
    }
    
    init(){
    
    additem()
    
    
    }
    

 

}