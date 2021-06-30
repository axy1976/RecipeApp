//
//  DetailVC.swift
//  Recipe App
//
//  Created by Akshay Jangir on 28/06/21.
//  Copyright © 2021 Akshay Jangir. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
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
    private var recepiesd = [
        """
        Ingredients ->

        - 2 1/2 cup gram flour (besan)
        - 3 cup ghee
        - 2 pinch baking soda
        - 1 1/2 teaspoon green cardamom
        - 1/2 teaspoon edible food color
        - 3 cup sugar
        - 2 cup water
        """,
        """
        Ingredients ->

        - 1 1/2 cup all purpose flour
        - 2 pieces ice cubes
        - 1/4 cup milk
        - 1/2 cup ghee
        - 1/2 cup ghee
        - 2 1/2 cup water
        - 1/8 teaspoon edible food color
        - 1 cup sugar
        - 1/2 teaspoon powdered green cardamom
        - 1 strand saffron
        - 1/2 tablespoon chopped almonds
        - 6 inches silver vark
        """,
        """
        Ingredients ->

        - 500 gm all purpose flour
        - 4 boiled potato
        - salt as required
        - 1/2 teaspoon turmeric
        - 1/2 teaspoon garam masala powder
        - 1/2 teaspoon sugar
        - 1/2 teaspoon carom seeds
        - 1/2 cup peas
        - 1/2 teaspoon red chilli powder
        - 1/2 teaspoon kasoori methi powder
        - 1/2 teaspoon chaat masala powder
        """,
        """
        Ingredients ->

        - 1 cup all purpose flour
        - 1/2 cup moong dal
        - 1 pinch powdered asafoetida
        - 1/4 teaspoon minced green chilli
        - 1/4 teaspoon garam masala powder
        - 2 teaspoon dry mango powder
        - 1 cup refined oil
        - 3 tablespoon beaten yoghurt (curd)
        - 2 tablespoon melted ghee
        - 1/2 teaspoon cumin seeds
        - 1/4 teaspoon minced ginger
        - 1/4 teaspoon coriander powder
        - 1/2 teaspoon red chilli powder
        - 1 tablespoon gram flour (besan)
        - salt as required
        """,
        """
        Ingredients ->

        - 200 gm paneer
        - 1/4 cup almonds
        - 5 strand saffron
        - 2 cup water
        - 2 tablespoon milk
        - 1/4 cup cashews
        - 1/4 cup pistachios
        - 1 teaspoon powdered green cardamom
        - 1 cup sugar
        """,
        """
        Ingredients ->

        - 50 gm paneer
        - 2 cup canola oil/ rapeseed oil
        - 500 ml boiling water
        - 1 slice lemon
        - 2 cup powdered sugar
        - 1 1/2 teaspoon powdered green cardamom
        - 150 gm mashed khoya
        - 2 tablespoon ghee
        - 4 strand saffron
        """,
        """
        Ingredients ->

        - 3 cup all purpose flour
        - 2 cup hung curd
        - 1/2 cup ghee
        - 3 cup sugar
        - 5 strand saffron
        - 1/2 teaspoon powdered green cardamom
        - 1/2 cup corn flour
        - 1 1/2 pinch baking soda
        - 2 cup sunflower oil
        - 3 cup water
        - 4 drops rose essence
        - 1/2 teaspoon edible food color
        """,
        """
        Ingredients ->

        - 2 litre full cream milk
        - 1/2 cup almonds
        - 2 cup sugar
        - 2 tablespoon corn flour
        - 4 green cardamom
        - 3 teaspoon rose water
        - 3 tablespoon lemon juice
        - 1 teaspoon baking powder
        - water as required
        - 1 teaspoon powdered green cardamom
        - 4 strand saffron
        """]
    private let dark = UIColor(red: 0.135, green: 0.208, blue: 0.314, alpha: 1)
    private let light = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    var query: Int?
    
    init(isearch:Int) {
        super.init(nibName:nil, bundle: nil)
        query = isearch
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let vu: UIView = {
        let viw = UIView()
        return viw
    }()
    private let btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("<- Back", for: .normal)
        btn.addTarget(self, action: #selector(backtohome), for: .touchUpInside)
        return btn
    }()
    private let btn4: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.actions, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    private let img: UIImageView = {
        let imgs = UIImageView()
        return imgs
    }()
    private let tlbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 30)
        return lbl
    }()
    private let tv: UITextView = {
        let txtv = UITextView()
        txtv.font = UIFont(name: "arial", size: 16)
        return txtv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: recepies[query!])
        view.backgroundColor = light
        view.addSubview(vu)
        vu.backgroundColor = light
        vu.addSubview(btn1)
        btn1.setTitleColor(dark, for: .normal)
        vu.addSubview(btn4)
        view.addSubview(img)
        tlbl.text = recepies[query!]
        tlbl.textColor = dark
        view.addSubview(tlbl)
        tv.text = recepiesd[query!]
        view.addSubview(tv)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vu.frame = CGRect(x: 0, y: 0, width: view.width, height: (view.height/9))
        btn1.frame = CGRect(x: 0, y: 30, width: 100, height: 40)
        btn4.frame = CGRect(x: view.width-50, y: 35, width: 30, height: 30)
        btn4.tintColor = dark
        btn4.backgroundColor = light
        img.frame = CGRect(x: 0, y: 80, width: view.width, height: 240)
        tlbl.frame = CGRect(x: 0, y: 320, width: view.width, height: 50)
        tv.frame = CGRect(x: 0, y: 370, width: view.width, height: view.height)
    }
    @objc public func backtohome() {
        let vc = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
