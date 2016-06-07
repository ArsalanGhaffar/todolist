//
//  ImageStore.swift
//  todolist
//
//  Created by Arsalan on 5/24/16.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import UIKit


class ImageStore:NSObject{

let cache = NSCache()
    
//    let test = NSUserDefaults.standardUserDefaults()
    

    func setImage(image : UIImage, forKey key: String){
        cache.setObject(image, forKey: key)
    
    
    }

    
    
    func imageforkey(key:String)-> UIImage?{
    return cache.objectForKey(key) as? UIImage
    
    }
    
    func deleteimageforkey(key:String){
    cache.removeObjectForKey(key)
    
    
    }


}