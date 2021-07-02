//
//  MenuCell.swift
//  RciepieApp
//
//  Created by DCS on 02/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    private let myImg: UIImageView = {
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    private let mylbl : UILabel = {
        let lbl = UILabel()
  
        lbl.font = .boldSystemFont(ofSize: 25)
        
        return lbl
    }()
    
    func setupFoodCellWith(title name:String, index:Int, and state: Bool){
        myImg.image = UIImage(named: name)
        mylbl.text = name
        
        setupUI(at: index, with: state)
    }
    public let mybtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "next"), for: .normal)
       btn.tintColor = .black
        btn.layer.cornerRadius = 10
        return btn
    }()
    private func setupUI(at index:Int, with state:Bool){
        
        contentView.addSubview(myImg)
        contentView.addSubview(mylbl)
        contentView.addSubview(mybtn)
        myImg.frame = CGRect(x: 20,y:10,width: 80,height: 100)
        mylbl.frame = CGRect (x: myImg.right + 20,y:10,width: 140,height: 80)
        mybtn.frame = CGRect(x: contentView.width - 40, y: 80, width: 30,height: 30)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
