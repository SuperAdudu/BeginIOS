//
//  AddViewController.swift
//  NNote
//
//  Created by Thảo An on 08/02/2023.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(TapSave))
        
    }
    
    @objc func TapSave(){
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text,noteField.text)
        }
    }
   

}
