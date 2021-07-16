//
//  ViewController.swift
//  Activity
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var button = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share))
        
        self.createButton()
        self.createTextField()
    }

    //MARK: - method
    
    
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton() {
        self.button = UIButton(type: .roundedRect)
        self.button.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.button.setTitle("Share", for: .normal)
        self.button.addTarget(self, action: #selector(share), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    @objc func share(param: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let message = "Enter text"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
        // custom activity
        let customItem = CustomActivity(title: "Custom Activity", image: UIImage(named: "pic")) { sharedItems in
            guard let sharedStrings = sharedItems as? [String] else { return }

            for string in sharedStrings {
                print("Here's the string: \(string)")
            }
        }
        // ----
        
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: [customItem])
        
        self.activityViewController!.excludedActivityTypes = [
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
        ]
        self.present(activityViewController!, animated: true, completion: nil)
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
}

