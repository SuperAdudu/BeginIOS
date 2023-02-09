//
//  DetailViewController.swift
//  NNote
//
//  Created by Thảo An on 08/02/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleLable: UILabel!
    @IBOutlet var noteLable: UITextView!
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLable.text = noteTitle
        noteLable.text = note
    }
    

    

}
