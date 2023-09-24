//
//  SecondViewController.swift
//  FirstTableView
//
//  Created by Дмитрий Пономарев on 15.09.2022.
//


import UIKit


class SecondViewController: UIViewController {
    
    //MARK: - UI properties
    
    
    
    let nameLb = UILabel()
    let surnameLb = UILabel()
    let image = UIImageView()
    
    private let items: Model
    
    init(items: Model){
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addViews()
        makeConstraints()
        setupViews()
        view.backgroundColor = .lightGray
    }
    
    //MARK: - objc method
}

private extension SecondViewController {
    
    //MARK: - addViews
    
    func addViews() {
        view.addSubview(nameLb)
        view.addSubview(surnameLb)
        view.addSubview(image)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        image.snp.makeConstraints {
            $0 .top.equalToSuperview().inset(100)
            $0 .centerX.equalToSuperview()
            $0 .size.equalTo(200)
        }
        nameLb.snp.makeConstraints {
            $0 .top.equalTo(image.snp.bottom).offset(50)
            $0 .centerX.equalToSuperview()
        }
        surnameLb.snp.makeConstraints {
            $0 .top.equalTo(nameLb.snp.bottom).offset(50)
            $0 .centerX.equalToSuperview()
            $0 .width.equalTo(300)
            $0 .height.equalTo(200)
            
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        nameLb.text = items.restorantName
        nameLb.textColor = .black
        
        
        
        nameLb.font = .systemFont(ofSize: 30)
        surnameLb.text = items.restorantLocation
        surnameLb.textColor = .black
        surnameLb.font = .systemFont(ofSize: 30)
        surnameLb.numberOfLines = 0
        surnameLb.textAlignment = .center
        surnameLb.adjustsFontSizeToFitWidth = true
        surnameLb.minimumScaleFactor = 0.4
        image.image = UIImage(named: items.imageOfRestorant)
        image.layer.cornerRadius = 100
        image.clipsToBounds = true
        
        
    }
}

