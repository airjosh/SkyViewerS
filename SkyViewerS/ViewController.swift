//
//  ViewController.swift
//  SkyViewerS
//
//  Created by Josue Arambula on 10/2/20.
//  Copyright © 2020 Josue Arambula. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Properties
    var pictures = [String]()
    enum Constants: String {
        case storyboardDetailsId = "Detail"
        case cellId = "Picture"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sky Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(likeApp))
        // this is a built-in system type that let us work whith a file system
        let fileManager = FileManager.default
        // set the resource path of our apps bundle
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        // a picture to load
        pictures = items.filter{ $0.hasPrefix("nssl") }.sorted()
    }

    // MARK: - TableView Delegate methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId.rawValue, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: Constants.storyboardDetailsId.rawValue) as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.title = "Picture \(indexPath.row+1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Objects
    @objc func likeApp() {
        let items = ["Hello there! Download this simple made with Swift here https://github.com/airjosh/SkyViewerS"]
                
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}

