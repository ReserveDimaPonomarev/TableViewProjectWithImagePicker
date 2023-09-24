//
//  CellForTableViewTableViewCell.swift
//  TableViewCourse
//
//  Created by Дмитрий Пономарев on 16.09.2022.
//

import UIKit
import SnapKit
class CellForTableViewTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - UI properties
    var nameOfRest = UILabel()
    var imageOfRest = UIImageView()
    
    
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureView(_ model: Model) {
        nameOfRest.text = model.restorantName
        imageOfRest.image = UIImage(named: "\(model.imageOfRestorant)")
    }
    
}

//MARK: - Private methods

private extension CellForTableViewTableViewCell {
    
    //MARK: - Setup
    
    func setup() {
        addViews()
        makeConstraints()
        setupViews()
    }
    
    //MARK: - addViews
    
    func addViews() {
        contentView.addSubview(nameOfRest)
        contentView.addSubview(imageOfRest)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        nameOfRest.snp.makeConstraints{
            $0 .top.bottom.equalToSuperview().inset(20)
            $0 .left.equalToSuperview().inset(150)
            $0 .right.equalToSuperview().inset(20)
        }
        imageOfRest.snp.makeConstraints{
            $0 .left.equalToSuperview().inset(30)
            $0 .size.equalTo(60)
            $0 .centerY.equalToSuperview().inset(20)
            
        }
        
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        nameOfRest.textColor = .black
        nameOfRest.font = .systemFont(ofSize: 20)
        imageOfRest.clipsToBounds = true
        

    }
}
