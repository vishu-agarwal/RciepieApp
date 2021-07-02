//
//  WebVC.swift
//  RciepieApp
//
//  Created by DCS on 02/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var query: String?
    
    init(search: String){
        
        super.init(nibName: nil, bundle: nil)
        query = search
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let webconfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero,configuration: webconfig)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myurl = URL(string: "https://recipes.fandom.com/wiki/\(query!)")
        let req = URLRequest(url: myurl!)
        webView?.load(req)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
