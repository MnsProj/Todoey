//
//  ToDoList2ViewController.swift
//  Todoey
//
//  Created by abc on 31/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoList2ViewController: UITableViewController {

    var todoItems: Results<Item>! // todoItems is a collection of results
        let realm = try! Realm()
         var selectedCategory : Category?{
            // Learn to use didset//
             didSet{
             loadItems()  //We call loaditems which calls all todoItems
             
         }
    }
         override func viewDidLoad() {
             super.viewDidLoad()
             print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
         }
      

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems?.count ?? 1   //if todoItems contain any cell then count will show otherwise retrn one cell
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       // print("cellForRowAt indexPath called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

        if  let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title  //cell have textLabel based on current item title

        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        //cell.accessoryType = item.done == true ? .checkmark : .none
            cell.accessoryType = item.done ? .checkmark : .none   //if item.done property is true then we give the cell a checmark otherwise none
        }else {
           cell.textLabel?.text = "No items added" //if there is no todoItems then return text "No items added" for the single cell
        }
        return cell
    }

    // MARK- TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(todoItems[indexPath.row])
       // Update data using realm
        if let item = todoItems?[indexPath.row] { //when we select any of cells then we grab a reference to the item by looking at the collection of results and grab the items at indexPath.row then we try to update the item
            do{
                try realm.write {    //To update the item
                    //realm.delete(item)  //To delete the item
                    item.done = !item.done  //toggle the item.done property to the opposite of what it is
                    print("Item successfully deleted")
            }
            }catch{
                print("error saving done status, \(error)" )
            }
        }
        tableView.reloadData()   //then we again reload the data and deselect our row
        tableView.deselectRow(at: indexPath, animated: true)

    }

    //MARK- Add New Items  and create alert
    @IBAction func AddButtonPressed(_ sender: Any) {
    
            var textField = UITextField()
            let alert = UIAlertController(title: "Add new todey item", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                //What will happen once the user clicks the add item button on our UIAlert

                print(textField.text!, "added successfully")

            //Add new item using realm
                if let currentCategory = self.selectedCategory{     //selectedCategory is optional if not nill then set it to name currentCategory
                    do{ try self.realm.write {  //commit
                        let newItem = Item()    //create new item
                        newItem.title = textField.text!  //setting the newItems title
                        newItem.dateCreated = Date()     //setting the newItems dateCreated to current date and time
                        currentCategory.items.append(newItem)  //currentCategories items property to append newItem
                        }
                    }catch {
                        print("Error saving new items, \(error)")
                    }
            }
                self.tableView.reloadData()  //then we reload after save the new data
        }
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Create new item"
                textField = alertTextField
                //print(alertTexField.text)
            }
            alert.addAction(action)
            present(alert,animated: true,completion: nil)

        }

        //MARK- Model Manipulation Methods
        func loadItems(){
            // here items means the category contains list of items
            todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
            tableView.reloadData()
        }

}
        // MARK:- Search bar methods
         //  Learn to use extension
        extension ToDoList2ViewController: UISearchBarDelegate {
// Finally when we search something and click the searchbutton
            func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
 // then we update collection of results todoItems, todoItems based on filter to a predicate which says title of the item must contain the argument %@, and the argument is whatever the user enters into the searchbar searchBar.text then sort the item by date in ascending order
                todoItems = todoItems?.filter("title CONTAINS [cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
                tableView.reloadData() // then we relod our data
                
         }

            //To load original list after exit from searching
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                if searchBar.text?.count == 0 {
                   loadItems()  //after dispatch serchbar again call load items to show all the items
            //To leave the cursor from searchbar and hide keyboard from background
                    DispatchQueue.main.async {
                        searchBar.resignFirstResponder()
                    }
    
                }
            }
    
}


