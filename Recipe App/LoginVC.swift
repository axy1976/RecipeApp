//
//  LoginVC.swift
//  Recipe App
//
//  Created by Akshay Jangir on 23/06/21.
//  Copyright © 2021 Akshay Jangir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let prof:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "recipe_app_logo")
        img.layer.cornerRadius = 100
        return img
    }()
    private let txt1:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
        txt.backgroundColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 0.3)
        txt.attributedPlaceholder = NSAttributedString(string: "E-MAIL", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.135, green: 0.208, blue: 0.314, alpha: 0.6)])
        txt.layer.cornerRadius = 20
        txt.setLeftPaddingPoints(20)
        txt.setRightPaddingPoints(20)
        txt.textColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
        return txt
    }()
    private let txt2:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
        txt.backgroundColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 0.3)
        txt.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.135, green: 0.208, blue: 0.314, alpha: 0.6)])
        txt.layer.cornerRadius = 20
        txt.setLeftPaddingPoints(20)
        txt.setRightPaddingPoints(20)
        txt.textColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
        return txt
    }()
    private let btnx:UIButton = {
        let btnx = UIButton()
        btnx.setTitle("LOGIN", for: .normal)
        btnx.layer.cornerRadius = 20
        btnx.addTarget(self, action: #selector(loginclicked), for: .touchUpInside)
        btnx.backgroundColor = .init(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
        return btnx
    }()
    @objc private func loginclicked() {
        let vc = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(prof)
        view.addSubview(txt1)
        view.addSubview(txt2)
        view.addSubview(btnx)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        prof.frame = CGRect(x: Int(view.width/2)-100, y: Int(view.height/5), width: 200, height: 200)
        txt1.frame = CGRect(x: 80, y: Int(view.height/5)+200, width: Int(view.width-160), height: 50)
        txt2.frame = CGRect(x: 80, y: Int(view.height/5)+270, width: Int(view.width-160), height: 50)
        btnx.frame = CGRect(x: 80, y: Int(view.height/5)+340, width: Int(view.width-160), height: 50)
    }
}

