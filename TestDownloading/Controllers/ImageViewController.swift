//
//  ImageViewController.swift
//  TestDownloading
//
//  Created by Владислав Мартяк on 18.02.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    // MARK: - Variables
    
    var newImage: UIImage!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullImageView.image = newImage
    }
}
