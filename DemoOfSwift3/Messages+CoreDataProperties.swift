//
//  Messages+CoreDataProperties.swift
//  DemoOfSwift3
//
//  Created by xie hu on 2016/12/20.
//  Copyright © 2016年 许之午. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Messages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Messages> {
        return NSFetchRequest<Messages>(entityName: "Messages");
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?

}
