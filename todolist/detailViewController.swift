//
//  detailViewController.swift
//  todolist
//
//  Created by Arsalan on 16/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import UIKit

class detailViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBAction func dismiskeyboard(sender: UITapGestureRecognizer) {
        
        
        view.endEditing(true)
//        view.resignFirstResponder()
    }
    
    @IBOutlet weak var tname: UILabel!
    
    
    @IBOutlet weak var tpriority: UILabel!
    
    
    @IBOutlet weak var tlocation: UILabel!
    
    
    @IBOutlet  var tnamefiled: UITextField!
    
    @IBOutlet  var tpriorityfiled: UITextField!
    
    @IBOutlet  var tlocationfield: UITextField!
    
    @IBOutlet var imageview: UIImageView!
    
    var taskmodel : taskModel!
    var imgstore : ImageStore!
    
    

    @IBAction func takeimage(sender: UIBarButtonItem) {
        let imagepicker = UIImagePickerController()
        // if cam found ok, else go to lib for photo
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagepicker.sourceType = .Camera
        
        }else{
        imagepicker.sourceType = .PhotoLibrary
        
        }
        
        
        imagepicker.delegate = self
    presentViewController(imagepicker, animated: true, completion: nil)
    
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgstore.setImage(image, forKey: taskmodel.itemkey)

        imageview.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = taskmodel.taskName
        
        
        let key = taskmodel.itemkey
        
        imageview.image = imgstore.imageforkey(key)
//        view.endEditing(true)
        tnamefiled.text = taskmodel.taskName
        tpriorityfiled.text = taskmodel.taskpriority
        tlocationfield.text = taskmodel.Location
        
        
        
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(animated: Bool) {
         taskmodel.taskName = tnamefiled.text!
         taskmodel.taskpriority = tpriorityfiled.text!
            taskmodel.Location = tlocationfield.text!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
