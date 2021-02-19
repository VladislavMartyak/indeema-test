//
//  ImageCell.swift
//  TestDownloading
//
//  Created by Владислав Мартяк on 18.02.2021.
//

import UIKit

class ImageCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Variables
    
    var urlSession: URLSession?
    var urlConfiguration: URLSessionConfiguration?
    var downloadTask: URLSessionDownloadTask?
    var downloadData: Data?
    var fileData: Data? = nil
    var isDownloading: Bool = false
    var isDownloaded: Bool = false
    var urlString: String = ""
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        urlConfiguration = URLSessionConfiguration.default
        let queue: OperationQueue = OperationQueue.main
        urlSession = URLSession.init(configuration: urlConfiguration!, delegate: self, delegateQueue: queue)
    }
    
    override func prepareForReuse() {
   
            self.thumbnailImageView.image = nil
            self.startButton.isEnabled = true
            self.progressLabel.text = "0%"
            self.downloadProgress.progress = 0
            self.startButton.setTitle("Start", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func startDownloadSingleFile(sender: AnyObject) {
        
        if isDownloading == false {
    
            startButton.setTitle("Stop", for: .normal)
            
            let url: NSURL = NSURL(string: self.urlString)!
            downloadTask = urlSession!.downloadTask(with: url as URL)
            downloadTask!.resume()
            isDownloading = true
            progressLabel.text = "0%"
            
        } else {
        
            startButton.setTitle("Start", for: .normal)
            
            downloadTask?.cancel()
            thumbnailImageView.image = nil
            
            downloadData = nil
            isDownloading = false
            downloadTask = nil
            
            downloadProgress.progress = 0
            progressLabel.text = "0%"
        }
    }
}

// MARK: - URLSessionDelegate, URLSessionDownloadDelegate
extension ImageCell: URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        isDownloading = false
        downloadData = nil
        progressLabel.text = "100%"
        
        do {
            
            let fileHandle: FileHandle = try FileHandle(forReadingFrom: location as URL)
            fileData = fileHandle.readDataToEndOfFile() as Data
            thumbnailImageView.image = UIImage(data: fileData!)
            
            startButton.setTitle("Downloaded", for: .normal)
            startButton.isEnabled = false
            isDownloaded = true
        } catch {
            print(error)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progressMetric = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        self.downloadProgress.setProgress(progressMetric, animated: false)
        
        progressLabel.text = String(format: "%.0f%%", floor(progressMetric * 100))
    }
}
