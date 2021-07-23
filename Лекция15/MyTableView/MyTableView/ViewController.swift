//
//  ViewController.swift
//  MyTableView
//
//  Created by Дмитрий Рудановский on 19.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var data = ["cat", "dog"]

    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.insetGrouped)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Table"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        


        
        self.updateLayout(with: self.view.frame.size)
    }

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    @objc func buttonAction() {
        print("button")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
           case self.tableView:
              return self.data.count
            default:
              return 0
           }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = self.data[indexPath.row]
        let button = UIButton(frame: CGRect(x: 300, y: 10, width: 20, height: 20))
        button.backgroundColor = .systemGray
        button.setTitle("O", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.addSubview(button)
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapped))
        button.addGestureRecognizer(tapGesture)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func tapped(cell: TableViewCell) {
        let vc = SecondViewController()
        vc.title = cell.textLabel?.text
        vc.view.backgroundColor = .white
        present(vc, animated: true, completion: nil)
    }
}

