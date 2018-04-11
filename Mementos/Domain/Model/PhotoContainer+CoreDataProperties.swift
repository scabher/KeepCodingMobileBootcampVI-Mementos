//
//  PhotoContainer+CoreDataProperties.swift
//  Mementos
//
//  Created by Sergio Cabrera Hernández on 28/3/18.
//  Copyright © 2018 Sergio Cabrera Hernández. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotoContainer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoContainer> {
        return NSFetchRequest<PhotoContainer>(entityName: "PhotoContainer")
    }

    @NSManaged public var imageData: NSData?
    @NSManaged public var note: Note?

}
