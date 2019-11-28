//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Dheeraj Arora on 19/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var mobile: String?
    @NSManaged public var city: String?
    @NSManaged public var attribute1: String?

}
