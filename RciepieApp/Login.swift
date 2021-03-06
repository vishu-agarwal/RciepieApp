//
//  ViewController.swift
//  RciepieApp
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {

    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 50)
        lbl.textColor = .white
        
        lbl.text = "V.R. RECIPE"
        lbl.textAlignment = .center
        
        return lbl
    }()
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("CLICK ME !!", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 5
        
        btn.addTarget(self, action: #selector(nextvc), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 45
        return btn
    }()
    @objc func nextvc(){
        
        let vc = MenuVC()
        navigationController? .pushViewController(vc, animated : true)
    }
    private let user:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter E-Mail"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center

        return txt
    }()
    private let pswd:UITextField = {
        let txt = UITextField()
        txt.textAlignment = .center
        txt.placeholder = "Enter Password"
        txt.textColor = .blue
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.isSecureTextEntry = true
        
        return txt
    }()
    /*private let bgimg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named : "1.jpg")
        return img
    }()*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mybtn)
        view.addSubview(user)
        view.addSubview(pswd)
        view.addSubview(mylbl)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "1.jpg")!)
      //  view.addSubview(bgimg)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
       // bgimg.frame = CGRect(x:0, y: view.safeAreaInsets.top, width: view.width, height: 700)
        mylbl.frame = CGRect(x: 40,y: 200,width: view.width-40,height: 40)
        user.frame = CGRect(x: 20,y: mylbl.bottom + 50,width: view.width-40,height: 80)
        pswd.frame = CGRect(x: 20,y: user.bottom + 20,width: view.width-40,height: 80)
        mybtn.frame = CGRect(x: 20,y: pswd.bottom + 20,width: view.width-40,height: 80)
    }

}

