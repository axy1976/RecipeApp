//
//  HomeVC.swift
//  Recipe App
//
//  Created by Akshay Jangir on 23/06/21.
//  Copyright © 2021 Akshay Jangir. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
//    private var recepiestate = [Int]()
    private let tblvu = UITableView()
    private var recepies = [
        "Motichoor Ladoo",
        "Ghevar",
        "Samose",
        "Kachori",
        "Rajbhog",
        "Gulab Jamun",
        "Jalebi",
        "Angoor Rabdi"]
    private var recepiesline = [
        "Looking for a quick sweet recipe to add soul to your celebrations, then try this easy Motichoor Ladoo recipe with step by step instructions!",
        "Wondering how to make Ghevar at home? Try this easy ghevar recipe today! This ghevar recipe is something every sweet lover should try at least once.",
        "A samosa is a fried or baked pastry with a savoury filling, such as spiced potatoes, onions, peas, cheese, or lentils.",
        "Yearning to devour in something delicious as well as interesting, then this Khasta Kachori recipe can be a perfect treat for such hunger pangs.",
        "Rajbhog is an authentic Bengali sweet, which will leave your palate mesmerized with the enchanting taste and texture.",
        "Gulab Jamun is an inseparable part of festivals, and here is how you can make it easily at home. This recipe will guide you with the step-by-step procedure with images.",
        "Just like Gulab Jamun, Jalebi is one of the most popular desserts of India and is a spiralled dish that needs time and practice.",
        "How about a delicious rasmalai recipe with a twist of flavours. The soft and spongy dessert soaked in creamy milk is to die for!"]
    private var recepieupdt = [
        "Added Just Now",
        "Added 1 Day Ago",
        "Added 3 Day Ago",
        "Added 4 Day Ago",
        "Added 7 Day Ago",
        "Added 12 Day Ago",
        "Added 15 Day Ago",
        "Added 19 Day Ago"]
    private let dark = UIColor(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
    private let light = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    private let prog:UIProgressView = {
        let prg = UIProgressView()
        prg.setProgress(0.0, animated: true)
        return prg
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3.0) {
            self.prog.setProgress(1.0, animated: true)
        }
        let seconds = 3.4
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.prog.isHidden = true
            self.vu.backgroundColor = self.light
            self.view.addSubview(self.vu)
            self.btn1.setTitleColor(self.dark, for: .normal)
            self.vu.addSubview(self.btn1)
            self.btn2.setTitleColor(self.dark, for: .normal)
            self.vu.addSubview(self.btn2)
            self.btn3.setTitleColor(self.dark, for: .normal)
            self.vu.addSubview(self.btn3)
            self.vu.addSubview(self.btn4)
            self.view.addSubview(self.tblvu)
            self.setupTableView()
            self.btn5.tintColor = self.light
            self.btn5.backgroundColor = self.dark
            self.view.addSubview(self.btn5)
        }
    }
    private let vu: UIView = {
        let viw = UIView()
        return viw
    }()
    private let btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("Browse", for: .normal)
        return btn
    }()
    private let btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("Trending", for: .normal)
        return btn
    }()
    private let btn3: UIButton = {
        let btn = UIButton()
        btn.setTitle("Saved", for: .normal)
        return btn
    }()
    private let btn4: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.actions, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    private let btn5: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.layer.cornerRadius = 30
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = dark
        view.tintColor = light
        prog.progressTintColor = light
        view.addSubview(prog)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        prog.frame = CGRect(x: 50, y: (view.height/2)-10, width: (view.width-100), height: 20)
        vu.frame = CGRect(x: 0, y: 0, width: view.width, height: (view.height/9))
        btn1.frame = CGRect(x: 20, y: 30, width: 60, height: 40)
        btn2.frame = CGRect(x: 80, y: 30, width: 90, height: 40)
        btn3.frame = CGRect(x: 165, y: 30, width: 60, height: 40)
        btn4.frame = CGRect(x: view.width-50, y: 35, width: 30, height: 30)
        btn4.tintColor = dark
        btn4.backgroundColor = light
        tblvu.frame = CGRect(x: 0, y: view.top+(view.height/9), width: view.width, height: (view.height - view.height/9 + 20) - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        btn5.frame = CGRect(x: (view.width/2)-30, y: (view.height-(view.height/9)), width: 60, height: 60)
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        tblvu.dataSource = self
        tblvu.delegate = self
        tblvu.register(cells.self, forCellReuseIdentifier: "cells")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recepies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! cells
        
        cell.setupcells(title: recepies[indexPath.row], index: indexPath.row, content: recepiesline[indexPath.row], updte: recepieupdt[indexPath.row])
        cell.lbl.addTarget(self, action: #selector(opencelldetails), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tblvu.beginUpdates()
            recepies.remove(at: indexPath.row)
            tblvu.deleteRows(at: [indexPath], with: .fade)
            tblvu.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }

    @objc public func opencelldetails(_ sender:UIButton) {
        let vc = DetailVC(isearch: sender.tag)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
