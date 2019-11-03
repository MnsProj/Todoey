//
//  ViewController.swift
//  Todoey
//
//  Created by abc on 11/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit
import CoreData

//class TodoListViewController: UITableViewController {
//
//   // var itemArray = ["Find Mike","Buy Banana", "Bike Sevice"]
//    var itemArray = [Item]()
//    var selectedCategory : Category?{
//       // Learn to use didset//
//        didSet{
//            loadItems()
//        }
//    }
////    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
//    //how to access singleton i.e shared application and get its delegate property as appDelegate 
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    //let defaults = UserDefaults.standard
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))        
//        
////        let newItem = Item()
////        newItem.title = "Find Mike"
////        newItem.done = true
////        itemArray.append(newItem)
////        
////        let newItem2 = Item()
////        newItem2.title = "Buy Banana"
////        itemArray.append(newItem2)
////        
////        let newItem3 = Item()
////        newItem3.title = "Bike Service"
////        itemArray.append(newItem3)
//        
//        
//        // Do any additional setup after loading the view.
////        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
////            itemArray =  items
////        }
//         //let request : NSFetchRequest<Item> = Item.fetchRequest()
//        
//    }
//
//// MARK - TableView Datasource methods
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//       // print("cellForRowAt indexPath called")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
//        
//        let item = itemArray[indexPath.row]
//        cell.textLabel?.text = item.title
//        
//        //Ternary operator ==>
//        // value = condition ? valueIfTrue : valueIfFalse
//        //cell.accessoryType = item.done == true ? .checkmark : .none
//        cell.accessoryType = item.done ? .checkmark : .none
////       if  item.done == true {
////            cell.accessoryType = .checkmark
////        }else {
////            cell.accessoryType = .none
////        }
//        return cell
//    }
//    
//    // MARK- TableView Delegate Methods
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
//        
//        // itemArray[indexPath.row].setValue("Completed", forKey: "title") //update
//        
//         itemArray[indexPath.row].done = !itemArray[indexPath.row].done //read
////        context.delete(itemArray[indexPath.row]) // Delete
////        itemArray.remove(at: indexPath.row) // Delete
//
//        saveItems()
//        //tableView.reloadData()
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//    }
//    
//    //MARK- Add New Items  and create alert
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        
//        var textField = UITextField()
//        let alert = UIAlertController(title: "Add new todey item", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            //What will happen once the user clicks the add item button on our UIAlert
//
//            print(textField.text!, "added successfully")
//            
//      //Learn crud using context//
//            let newItem = Item(context: self.context)
//            newItem.title = textField.text!
//            newItem.done = false
//            newItem.parentCategory = self.selectedCategory
//            self.itemArray.append(newItem)
//            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
//            self.saveItems()
//            
//            self.tableView.reloadData()
//        }
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Create new item"
//            textField = alertTextField
//            //print(alertTexField.text)
//        }
//        alert.addAction(action)
//        self.present(alert,animated: true,completion: nil)
//        
//    }
//    
//    //MARK- Model Manipulation Methods
//    
//    func saveItems(){
//  // Learn how to commit current state of context using context.save to persistentContainer//
//    do {
//        try context.save()
//    }catch {
//        print("Error saving context, \(error)")
//    }
//    self.tableView.reloadData()
//    }
//    
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(),predicate: NSPredicate? = nil){
//   //     let request : NSFetchRequest<Item> = Item.fetchRequest()
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//        
//        if let additionalPredicate = predicate{
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,additionalPredicate])
//        }else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemArray = try context.fetch(request)
//        }catch {
//            print("Error fetching data from context \(error)")
//        }
//        tableView.reloadData()
//    }
//}
//
//    // MARK:- Search bar methods
////Learn to use extension
//    extension TodoListViewController: UISearchBarDelegate {
//        
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            let request : NSFetchRequest<Item> = Item.fetchRequest()
//            let predicate = NSPredicate(format: "title CONTAINS[CD] %@", searchBar.text!)
//            request.predicate = predicate
//            print(searchBar.text!)
//            let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//            request.sortDescriptors = [sortDescriptor]
//            
//            loadItems(with: request,predicate: predicate)
////            do{
////                itemArray = try context.fetch(request)
////            }catch {
////                print("Error fetching data from context \(error)")
////            }
////            tableView.reloadData()
//
//        }
//        
//       // To load original list after exit from searching
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            if searchBar.text?.count == 0 {
//                loadItems()
//       // To leave the cursor from searchbar and hide keyboard from background
//                DispatchQueue.main.async {
//                    searchBar.resignFirstResponder()
//                }
//                
//            }
//        }
//}
