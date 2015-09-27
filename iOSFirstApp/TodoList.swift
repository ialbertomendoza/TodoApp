//
//  TodoList.swift
//  iOSFirstApp
//
//  Created by Alberto Mendoza on 26/09/15.
//  Copyright © 2015 Alberto Mendoza. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    var items: [String] = []
    
    // Inicializador, aquí podemos cargar recursos iniciales
    override init() {
        super.init()
        loadItems()
    }
    
    private let fileURL: NSURL = {
        let fileMaganer = NSFileManager.defaultManager()
        let documentDirectoryURLs = fileMaganer.URLsForDirectory(.DocumentDirectory,
            inDomains: .UserDomainMask) as [NSURL] // Casting for use Swift plist struct
        let documentDirectoryURL = documentDirectoryURLs.first!
        print("Path de documentos"+("\(documentDirectoryURL)"))
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()
    
    
    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        if itemsArray.writeToURL(self.fileURL, atomically: true) {
            print("Guardado correctamente")
        } else {
            print("No se pudo guardar")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOfURL: self.fileURL) as? [String] { // Casting
            self.items = itemsArray
        }
    }
}

extension TodoList : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
            forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        return cell
    }
}
