//
//  cells.swift
//  Recipe App
//
//  Created by Akshay Jangir on 27/06/21.
//  Copyright © 2021 Akshay Jangir. All rights reserved.
//

import UIKit

class cells: UITableViewCell {
    
    let dark = UIColor(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
    private let light = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    private let img:UIImageView = {
        let mv = UIImageView()
        mv.contentMode = .scaleAspectFill
        mv.clipsToBounds = true
        return mv
    }()
    
    public let lbl:UIButton = {
        let labl = UIButton()
        labl.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        return labl
    }()
    
    public let btn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.tintColor = .init(red: 0.983, green: 0.272, blue: 0.243, alpha: 1)
        return btn
    }()
    
    private let txtvu:UITextView = {
        let txt = UITextView()
        txt.font = UIFont(name: "arial", size: 17)
        txt.textColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
        return txt
    }()
    
    private let lblx:UILabel = {
        let labl = UILabel()
        labl.font = UIFont(name: "arial", size: 14)
        labl.textColor = .green
        return labl
    }()
    
    func setupcells(title name:String, index:Int, content:String, updte:String) {
        img.image = UIImage(named: name)
        lbl.setTitle(name, for: .normal)
        txtvu.text = content
        lbl.tag = index
        lblx.text = updte
        setupUI(at: index)
    }
    
    private func setupUI(at index:Int) {
        contentView.backgroundColor = light
        contentView.addSubview(img)
        lbl.setTitleColor(dark, for: .normal)
        contentView.addSubview(lbl)
        txtvu.textColor = dark
        contentView.addSubview(txtvu)
        contentView.addSubview(lblx)
        contentView.addSubview(btn)
        contentView.frame = CGRect(x: 20, y: 20, width: contentView.width-40, height: contentView.height-20)
        img.frame = CGRect(x: 20, y: 20, width: 140, height: 160)
        lbl.frame = CGRect(x: img.right + 20, y: 20, width: 200, height: 20)
        txtvu.frame = CGRect(x: img.right + 17, y: 40, width: contentView.width-img.width-40, height: contentView.height-lbl.height-32)
        lblx.frame = CGRect(x: img.right + 20, y: contentView.height-20, width: 150, height: 40)
        btn.frame = CGRect(x: contentView.width - 30, y: contentView.height-20, width: 40, height: 40)
    }
}
