//
//  ViewController.swift
//  WebView
//
//  Created by bam on 13/06/19.
//  Copyright © 2019 bam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let url = URL(string: "https://stackoverflow.com") {
//            webview.loadRequest(URLRequest(url: url))
//        }
        
        if let url = URL(string: "https://stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if let error = error {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        if let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) {
                            print(dataString)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

