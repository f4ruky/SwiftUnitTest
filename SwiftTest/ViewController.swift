//
//  ViewController.swift
//  SwiftTest
//
//  Created by Faruk Yaşar on 7.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var toDoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    @IBAction func addClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Item", message: "Enter Your To Do Item", preferredStyle: .alert)
        
        alert.addTextField { textfiled in
            textfiled.placeholder = "Enter Item"
        }
        
        let okbutton = UIAlertAction(title: "OK", style: .default){ action in
            guard let textfiled = alert.textFields?[0], let inputText = textfiled.text, !inputText.isEmpty else {
                return
            }
            self.toDoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
        
        alert.addAction(okbutton)
        self.present(alert, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath] ,with: .automatic)
        }
    }
}

