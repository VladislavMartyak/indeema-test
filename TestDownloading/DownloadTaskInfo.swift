//
//  DownloadTaskInfo.swift
//  TestDownloading
//
//  Created by Владислав Мартяк on 18.02.2021.
//

import Foundation

class DownloadTaskInfo: NSObject {
    
    var name: String?
    var url: String? = ""
    var isDownload: Bool = false
    var progress: String = ""
    
    var downloadTask: URLSessionDownloadTask?
    var downloadTaskId: Int?
    var downloadData: Data?

}
