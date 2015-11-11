//
//  AboutViewController.swift
//  BullsEye
//
//  Created by legr on 09/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html"){
            if let htmlData = NSData(contentsOfFile: htmlFile){
                let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
    }
}
