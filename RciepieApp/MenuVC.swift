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
    
    private var foodState = [Int]()
    
    private var foodImg = ["Samosa","Rajbhog","Kachori","Chaat","Jalebi","DalBatti","MirchiBada"]
    private var foodAbt = ["SAMOSA","RAJBHOG ","KACHORI","CHAAT","JALEBI","DAL-BATTI","MIRCHI-BADA"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mytblview)
        title = "Receipies...."
        
        view.backgroundColor = .white
        
        setupTblView()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        mytblview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    
    private func setupTblView(){
        mytblview.dataSource = self
        mytblview.delegate = self
        mytblview.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodImg.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.setupFoodCellWith(title: foodImg[indexPath.row], index: indexPath.row, and: (foodState.contains(indexPath.row) ? true : false))
        
        cell.mybtn.addTarget(self,action: #selector(openDetails), for: .touchUpInside)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        _ = tableView.cellForRow(at: indexPath) as! MenuCell
        if !foodState.contains(indexPath.row)
        {
            foodState.append(indexPath.row)
        }
        openDetails(_sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mytblview.beginUpdates()
            foodImg.remove(at: indexPath.row)
            mytblview.deleteRows(at: [indexPath], with: .fade)
            mytblview.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @objc private func openDetails(_sender:Int) {
        navigationController?.pushViewController(WebVC(search: foodImg[_sender]), animated: true)
    }
    
}
