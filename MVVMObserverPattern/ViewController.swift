//
//  ViewController.swift
//  MVVMObserverPattern
//
//  Created by wfh on 09/03/20.
//  Copyright © 2020 Harsha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataEntryTextField: UITextField!
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.setTitle("ADD", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(tableViewCell.self, forCellReuseIdentifier: "identifier")
    }
    
    @IBAction func addTextButtonAction(_ sender: Any) {
        
    }
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        cell.textLabel?.text = "test Observer"
        return cell
    }
}

