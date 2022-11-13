//
//  ViewController.swift
//  URLSession_DownloadTask
//
//  Created by Wojciech Spaleniak on 16/10/2022.
//

/*
 NOTE:
 We have to update our UI only in Main Thread (DispatchQueue.main.async {...})
 
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var downloadImageView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLbl: UILabel!
    
    var index = 0
    
    let urlString = [
        "https://www.androidheadlines.com/wp-content/uploads/2022/03/iPhone-SE-2022-wallpaper-1.jpg",
        "https://img2.wallspic.com/crops/9/6/8/5/6/165869/165869-apples-ios-ios_14-water-blue-1284x2778.jpg",
        "https://iphoneswallpapers.com/wp-content/uploads/2021/11/Beach-Ocean-Wave-iPhone-Wallpaper.jpg",
        "https://images.squarespace-cdn.com/content/v1/51a26726e4b0f0ad7357f298/1624568232979-EKOD9Y2UMW10UAQVPMYJ/iPhone-macOS_Monterey_wallpaper_lightmodemode.png",
        "https://wallpaperaccess.com/full/4737980.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressLbl.alpha = 0.5
        progressBar.isHidden = true
        downloadImageView.contentMode = .scaleAspectFill
    }

    @IBAction func downloadBtnClicked(_ sender: UIButton) {
        progressLbl.isHidden = false
        progressLbl.text = "0%"
        progressBar.isHidden = false
        progressBar.progress = 0
        downloadImageView.image = nil
        
        guard let url = URL(string: urlString[index]) else {
            print("This is an invalid URL")
            return
        }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url).resume()
        
        index += 1
        if index == urlString.count {
            index = 0
        }
    }
}



extension ViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        guard let data = try? Data(contentsOf: location) else {
            print("The data could not be loaded")
            return
        }
        let image = UIImage(data: data)
        DispatchQueue.main.async { [weak self] in
            self?.downloadImageView.image = image
            self?.progressLbl.isHidden = true
            self?.progressBar.isHidden = true
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async { [weak self] in
            self?.progressBar.progress = progress
            self?.progressLbl.text = "\(Int(progress * 100))%"
        }
    }
}

