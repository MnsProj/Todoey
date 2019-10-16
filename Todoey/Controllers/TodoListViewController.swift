//
//  ViewController.swift
//  Todoey
//
//  Created by abc on 11/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   // var itemArray = ["Find Mike","Buy Banana", "Bike Sevice"]
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    //let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath!)        
        
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        newItem.done = true
//        itemArray.append(newItem)
//        
//        let newItem2 = Item()
//        newItem2.title = "Buy Banana"
//        itemArray.append(newItem2)
//        
//        let newItem3 = Item()
//        newItem3.title = "Bike Service"
//        itemArray.append(newItem3)
        
        
        // Do any additional setup after loading the view.
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray =  items
//        }
        
        loadItems()
    }

// Mark- TableView Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // print("cellForRowAt indexPath called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        //cell.accessoryType = item.done == true ? .checkmark : .none
        cell.accessoryType = item.done ? .checkmark : .none
//       if  item.done == true {
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        }
        return cell
    }
    
    // Mark- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        //tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //Mark- Add New Items  and create alert
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the add item button on our UIAlert

            print(textField.text!, "added successfully")
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.saveItems()
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTexField) in
            alertTexField.placeholder = "Create new item"
            textField = alertTexField
            //print(alertTexField.text)
        }
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
        
    }
    
    //Mark- Model Manipulation Methods
    
    func saveItems(){
        
    
    let encoder = PropertyListEncoder()
    do {
        let data = try encoder.encode(itemArray)
        try data.write(to: dataFilePath!)
    }catch {
        print("Error encoding item array, \(error)")
    }
    self.tableView.reloadData()
    }
    
    func loadItems(){
        
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            }catch {
                print("Error encoding item array, \(error)")
            }
        }
    }
}

