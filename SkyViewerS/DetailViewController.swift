//
//  DetailViewController.swift
//  SkyViewerS
//
//  Created by Josue Arambula on 10/3/20.
//  Copyright © 2020 Josue Arambula. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageToLoad = selectedImage else { return }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        navigationItem.largeTitleDisplayMode = .never
        imageView.image = UIImage(named: imageToLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.hidesBarsOnTap = false
    }

    // MARK: - Objects
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let name = selectedImage else {
            print("No image found")
            return
        }
        let items: [Any] = [image, name]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        // useful for ipads
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
