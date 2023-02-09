//
//  ViewController.swift
//  NNote
//
//  Created by Thảo An on 08/02/2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var TheNotes:[(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        table.dataSource = self
        table.delegate = self
    }

    @IBAction func addNewNote()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "new") as! AddViewController
        vc.title = "New note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {noteTitle, note in
            
            self.navigationController?.popToRootViewController(animated: true)
            self.TheNotes.append((title:noteTitle,note:note))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    //----------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TheNotes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        cell?.textLabel?.text = TheNotes[indexPath.row].title
        cell?.detailTextLabel?.text = TheNotes[indexPath.row].note
        return cell!
    }
    
    //----------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let TheNote = TheNotes[indexPath.row]
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailnote") as! DetailViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = TheNote.title
        vc.note = TheNote.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //------------------------
    
    
}

