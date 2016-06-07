//
//  CoreDataStack.swift
//  todolist
//
//  Created by Arsalan on 02/06/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    let managedObjectModelName : String!
    
    // the compiler to assure it that if this class were to have any subclasses, they would inherit or implement this same initializer.
    required init(modelName : String){
        
        managedObjectModelName = modelName
        
    }
    
    // lazy property is initialized when it is about to use, not when it is created
    
    private lazy var manageObjectModel : NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.managedObjectModelName, withExtension: "momd")!
        return  NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    
    //    The mapping between an object graph and the persistent store is accomplished using an
    //    instance of NSPersistentStoreCoordinator
    //    The persistent store coordinator
    //    needs to know two things: “What are my entities?” and “Where am I saving to and loading
    //    data from?
    
    
    
    /////****   helper for accessing the application's Documents directory    ***/////
    
    
    
    private var applicationDocumentDirectory : NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
        
        
    }()
    
    
    
    
    private lazy var presistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.manageObjectModel)
        
        
        let pathComponent = "\(self.managedObjectModelName).sqlite"
        let url = self.applicationDocumentDirectory.URLByAppendingPathComponent(pathComponent)
        
        let store = try! coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        return coordinator
        
        
    }()
    
    ////*****   nspersistentstore entity and model defined    ******//////
    
    
    
    
    
    ////****    save data    ****//////
    lazy var mainQueueContext: NSManagedObjectContext = {
        let moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.presistentStoreCoordinator
        moc.name = "Main Queue Context (UI Context)"
        return moc
    }()
    
    
        /*******************************************************************************
     With the Core Data stack complete, you can now interact with it. Primarily, you will do
     this through its mainQueueContext. This is how you will both create new entities and
     save changes.
     ******************************************************************************/

    
}

