//
//  CoreDataStack.swift
//  Planets
//
//  Created by SravsRamesh on 07/06/23.
//

import Foundation
import CoreData
// MARK: - Core Data stack
class CoreDataStack {
    
    static let sharedInstance = CoreDataStack()
    private  init() {}
    

    var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Planets")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    private func createPhotoEntityFrom(dictionary: [String: AnyObject]) -> NSManagedObject? {
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            if let photoEntity = NSEntityDescription.insertNewObject(forEntityName: "Planet", into: context) as? Photo {
                photoEntity.author = dictionary["author"] as? String
                photoEntity.tags = dictionary["tags"] as? String
                let mediaDictionary = dictionary["media"] as? [String: AnyObject]
                photoEntity.mediaURL = mediaDictionary?["m"] as? String
                return photoEntity
            }
            return nil
        }
}
