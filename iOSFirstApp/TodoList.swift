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
    func addItem(item: String) {
        items.append(item)
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
