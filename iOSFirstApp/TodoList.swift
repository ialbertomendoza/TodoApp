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
