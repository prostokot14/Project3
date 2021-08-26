//
//  ViewController.swift
//  Project3
//
//  Created by Антон Кашников on 26.08.2021.
//
import UIKit
class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default // a data type that lets us work with the filesystem, and in our case we'll be using it to look for files
        let path = Bundle.main.resourcePath! // set to the resource path of our app's bundle
        let items = try! fm.contentsOfDirectory(atPath: path) // set to the contents of the directory at a path (an array of strings containing filenames)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    // To make the table view show as many rows as necessary for the pictures array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
}
