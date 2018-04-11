//
//  Container.swift
//  Mementos
//
//  Created by Sergio Cabrera Hernández on 28/3/18.
//  Copyright © 2018 Sergio Cabrera Hernández. All rights reserved.
//

import UIKit
import CoreData

struct Container {
    static let mainContainer = NSPersistentContainer(name: "Mementos")
    
    
}

func initCoreData() {
    // Abrir la bd
    let cont = Container.mainContainer
    cont.loadPersistentStores { (description, error) in
        if let err = error {
            fatalError("Failed to load persisten store \(err)")
        }
        
    }
}

func playWithCoreData() {
    // Crear objetos
    
    let n1 = NSEntityDescription.insertNewObject(forEntityName: Note.entityName,
                                                 into: Container.mainContainer.viewContext) as! Note
    n1.text = "This is a test"
    n1.creationDate = NSDate()
    print(n1)
    
    let n2 = NSEntityDescription.insertNewObject(forEntityName: Note.entityName,
                                                 into: Container.mainContainer.viewContext) as! Note
    n1.text = "Another note"
    n1.creationDate = NSDate()
    
    let photo = NSEntityDescription.insertNewObject(forEntityName: PhotoContainer.entityName,
                                                    into: Container.mainContainer.viewContext) as! PhotoContainer
    
    let img = UIImage(named: "image.png")
    photo.imageData = NSData(data: UIImageJPEGRepresentation(img!, 0.9)!)
    
    // Relacionarlos
    n1.photo = photo
    
    // Modificar
    n2.text = "new note"
    
    // Buscar
    let req = NSFetchRequest<Note>(entityName: "Note")
    req.fetchBatchSize = 100    // Tamaño de paginado
    req.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
    
    let results = try? Container.mainContainer.viewContext.execute(req)
    
    print(results)
    
    // Borrar
    
    // Guardar
}
