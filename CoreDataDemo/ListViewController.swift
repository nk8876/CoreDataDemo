//
//  ListViewController.swift
//  CoreDataDemo
//
//  Created by Dheeraj Arora on 19/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String:String],index: Int, isEdit: Bool)
    
}
class ListViewController: UIViewController {
    var student = [Student]()
    var delegate: DataPass!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.student = AllMethods.shareInstance.getStudentData()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.navigationController!.setNavigationBarHidden(false, animated: true)
        navigationController!.navigationBar.tintColor = .white
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
}


extension ListViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//        cell.lblName.text = student[indexPath.row].name
//        cell.lblMobile.text = student[indexPath.row].mobile
//        cell.lblAddress.text = student[indexPath.row].attribute1
//        cell.lblCity.text = student[indexPath.row].city
           cell.student = student[indexPath.row]
           return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = AllMethods.shareInstance.deleteData(index: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name": student[indexPath.row].name,"mobile": student[indexPath.row].mobile,"city":student[indexPath.row].city,"address":student[indexPath.row].attribute1]
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        self.navigationController!.popViewController(animated: true)
    }
}

