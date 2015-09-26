//
//  ViewController.swift
//  iOSFirstApp
//
//  Created by Alberto Mendoza on 25/09/15.
//  Copyright © 2015 Alberto Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let todoList = TodoList()
    
    @IBAction func addButtonPressed(sender: UIButton) {
        print("Agregando un elemento a la lista"+("\(itemTextField.text)"))
        todoList.addItem(itemTextField.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

