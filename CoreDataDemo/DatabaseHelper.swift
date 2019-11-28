//
//  DatabaseHelper.swift
//  CoreDataDemo
//
//  Created by Dheeraj Arora on 19/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AllMethods: NSObject {
    static let shareInstance:AllMethods = AllMethods()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //SAVE DATA
    func  save(object:[String:String])  {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = object["name"]
        student.mobile = object["mobile"]
        student.attribute1 = object["address"]
        student.city = object["city"]
        do {
            try context.save()
        } catch  {
            print("con't save data")
        }
     }
    
    //GET DATA
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student =  try context.fetch(fetchRequest) as! [Student]
        } catch  {
            print("can not get data")
        }
        return student
    }
    
    //DELETE DATA
    func deleteData(index:Int) ->[Student]  {
        var student = getStudentData()
        context.delete(student[index])
        student.remove(at: index)
        do {
            try context.save()
        } catch  {
            print("can not delete data")
        }
        return student
    }
    
    //UPDATE DATA
    func editData(object: [String:String], i: Int) {
         var student = getStudentData()
         student[i].name = object["name"]
         student[i].mobile = object["mobile"]
         student[i].city = object["city"]
         student[i].attribute1 = object["attribute1"]
        do{
            try context.save()
        }catch{
            print("data does not updated")
        }
    }
}
