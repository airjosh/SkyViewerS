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
   // var imageTitle: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageToLoad = selectedImage else { return }
        
        //title = selectedImage
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
    
}
