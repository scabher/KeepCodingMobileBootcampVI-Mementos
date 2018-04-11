//
//  Note+CoreDataProperties.swift
//  Mementos
//
//  Created by Sergio Cabrera Hernández on 28/3/18.
//  Copyright © 2018 Sergio Cabrera Hernández. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var photo: PhotoContainer?

}
