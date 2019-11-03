//
//  CategoryViewController.swift
//  Todoey
//
//  Created by abc on 23/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit
import CoreData
//class CategoryViewController: UITableViewController {
//
//    var categoryArray = [Category]()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
//         loadCategories()
//    }
//
//    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return categoryArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
//        let category = categoryArray[indexPath.row]
//        cell.textLabel?.text = category.name
//       
//        return cell
//    }
//    
//    // MARK: - Tableview delegate methods
//       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        performSegue(withIdentifier: "goToItems", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! TodoListViewController
//        if let indexpath = tableView.indexPathForSelectedRow{
//        destinationVC.selectedCategory = categoryArray[indexpath.row]
//    }
//}
//    
//    // MARK: - Data manipulation methods
//    func saveCategories(){
//        do{
//            try context.save()
//        }catch{
//            print("Error saving Context, \(error)")
//            
//        }
//        tableView.reloadData()
//    }
//    
//    func loadCategories(request: NSFetchRequest<Category> = Category.fetchRequest() ){
//    
//        do{
//            categoryArray = try context.fetch(request)
//        }catch {
//            print("Error fetching data from Context \(error)")
//        }
//        tableView.reloadData()
//    }
//
//    // MARK: - Add new categories
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        var textField = UITextField()
//        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Add", style:.default) {(action) in
//                    
//            let newCategory = Category(context: self.context)
//            newCategory.name = textField.text
//            self.categoryArray.append(newCategory)
//            self.saveCategories()
//            self.tableView.reloadData()
//    }
//        alert.addTextField { (field) in
//            field.placeholder = "Type New Category"
//            textField = field
//        }
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
//        
//  }
//}
