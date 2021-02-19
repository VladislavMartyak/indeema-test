//
//  DownloadsViewController.swift
//  TestDownloading
//
//  Created by Владислав Мартяк on 18.02.2021.
//

import UIKit

class DownloadsTableController: UIViewController {
    
    // MARK: - Constants
    
    let images = [
        ["Image 1", "https://upload.wikimedia.org/wikipedia/commons/2/2d/Snake_River_%285mb%29.jpg"],
        ["Image 2", "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_2500kB.jpg"],
        ["Image 3", "https://www.satsignal.eu/wxsat/msg-1-fc-40.jpg"],
        ["Image 4", "https://www.satsignal.eu/wxsat/Meteosat7-full-scan.jpg"],
        ["Image 5", "https://apod.nasa.gov/apod/image/2102/SwissAlpsMartianSky.jpg"],
        ["Image 6", "https://eoimages.gsfc.nasa.gov/images/imagerecords/147000/147939/iceberg68apieces_202143_lrg.jpg"],
        ["Image 7", "https://eoimages.gsfc.nasa.gov/images/imagerecords/147000/147924/namibiagreening_tmo_202029_lrg.jpg"],
        ["Image 8", "https://eoimages.gsfc.nasa.gov/images/imagerecords/147000/147924/namibiagreening_tmo_202138_lrg.jpg"],
        ["Image 9", "https://www.nasa.gov/sites/default/files/thumbnails/image/50951261693_1a133acf1a_o.jpg"],
        ["Image 10", "https://www.nasa.gov/sites/default/files/thumbnails/image/picture-01a.jpg"],
        ["Image 11", "https://www.nasa.gov/sites/default/files/thumbnails/image/coalsack_acs1_hpfinal.jpg"],
        ["Image 12", "https://www.nasa.gov/sites/default/files/thumbnails/image/jsc2017e126052.jpg"],
        ["Image 13", "https://upload.wikimedia.org/wikipedia/commons/2/2d/Snake_River_%285mb%29.jpg"],
        ["Image 14", "https://www.nottingham.ac.uk/studywithus/international-applicants/images-mulitimedia/country-pages/25818repro.jpg"],
        ["Image 15", "https://www.nottingham.ac.uk/chemistry-bpu/images-multimedia/christuck.png"],
        ["Image 16", "https://www.nottingham.ac.uk/utc/images-multimedia/ring-fixture.jpg"],
        ["Image 17", "https://www.nottingham.ac.uk/home/featureevents/2019/images/37371repro.jpg"],
        ["Image 18", "https://www.nottingham.ac.uk/community/images-multimedia/jills-images/female-undergraduate-student-in-hallward-library.jpg"],
        ["Image 19", "https://upload.wikimedia.org/wikipedia/commons/6/62/Starsinthesky.jpg"],
        ["Image 20", "https://upload.wikimedia.org/wikipedia/commons/b/b4/The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819.jpg"]
        ]
    
    // MARK: - Outlets
    
    @IBOutlet weak var downloadsTableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadsTableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DownloadsTableController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = downloadsTableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.titleLabel.text = images[indexPath.row][0]
        cell.progressLabel.text = "0%"
        cell.downloadProgress.progress = 0.0
        
        cell.urlString = images[indexPath.row][1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = downloadsTableView.cellForRow(at: indexPath) as! ImageCell
        
        downloadsTableView.deselectRow(at: indexPath, animated: true)
        
        if currentCell.isDownloaded {
            let displayVC : ImageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
            displayVC.newImage = currentCell.thumbnailImageView.image
            
            self.present(displayVC, animated: true, completion: nil)
        }
    }
}


