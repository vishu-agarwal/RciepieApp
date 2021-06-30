//
//  MenuVC.swift
//  RciepieApp
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    private let mytblview = UITableView()
    private var foodImg = ["Samosa","Rajbhog","Kachori","Chaat","Jalebi","DalBatti","MirchiBada"]
    private var foodAbt = ["SAMOSA","RAJBHOG ","KACHORI","CHAAT","JALEBI","DAL-BATTI","MIRCHI-BADA"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mytblview)
        title = "Receipies...."
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(shuffle))
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        mytblview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reciepeCell", for: <#T##IndexPath#>) as! RcpTblCell
        cell.food(title: foodImg[indexPath.row], and: indexPath.row, Abt: foodAbt[indexPath.row])
        
    }
    
    
    private func setupTblView(){
        mytblview.dataSource = self
        mytblview.delegate = self
        mytblview.register(UITableViewCell.self, forCellReuseIdentifier: "reciepeCell")
    }
    
}
