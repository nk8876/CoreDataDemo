//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Dheeraj Arora on 19/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,DataPass{
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnGetData: UIButton!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
         setView()
         setCustomeImage()
    }

    func setView()   {
        //listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        btnSave.backgroundColor = .white
        btnSave.layer.cornerRadius = 20
        btnSave.layer.borderWidth = 1
        btnSave.setTitle("Save", for: .normal)
        btnSave.setTitleColor(UIColor.black, for: .normal)
        btnSave.layer.borderColor = UIColor.black.cgColor
        
        btnGetData.backgroundColor = .white
        btnGetData.layer.cornerRadius = 20
        btnGetData.layer.borderWidth = 1
        btnGetData.setTitle("Get Data", for: .normal)
        btnGetData.setTitleColor(UIColor.black, for: .normal)
        btnGetData.layer.borderColor = UIColor.black.cgColor
        self.hideKeyboardTappedOutside()
        self.addDoneButtonOnKeyboard()
      
    }

    @objc func keyboardWillChange(notification:Notification)
    {
        guard let heightRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification
        {
             view.frame.origin.y = -heightRect.height + 300
        }else{
            view.frame.origin.y = 0
        }
        print("Keyboard will show:\(notification.name.rawValue)")
       
    }
    deinit {
        //stop listening for keyboard hide/show events
       
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    func addDoneButtonOnKeyboard()   {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneCancel))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace,doneButton], animated: true)
        txtName.inputAccessoryView = toolBar
        txtMobile.inputAccessoryView = toolBar
        txtAddress.inputAccessoryView = toolBar
        txtCity.inputAccessoryView = toolBar

    }
     @objc func doneCancel()
     {
        view.endEditing(true)
     }
    
    
    @IBAction func saveData(_ sender: UIButton) {
        let dict = ["name":txtName.text,"mobile":txtMobile.text,"address":txtAddress.text,"city":txtCity.text]
        if isUpdate{
            AllMethods.shareInstance.editData(object: dict as! [String:String], i: i)
        }else{
             AllMethods.shareInstance.save(object: (dict as? [String : String])!)
        }
       
    }
    
    @IBAction func btnShowData(_ sender: UIButton) {
        let nextPage = storyboard!.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        nextPage.delegate = self
        self.navigationController!.pushViewController(nextPage, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("retuen pressed")
        return false
    }
   
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtMobile.text = object["mobile"]
        txtCity.text = object["city"]
        txtAddress.text = object["address"]
        i = index
        isUpdate = isEdit
    }
}

extension ViewController{
    func hideKeyboardTappedOutside()  {
        let showKeyboard:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(showKeyboard)
    }
    
   @objc func DismissKeyboard()  {
        view.endEditing(true)
    }
}
