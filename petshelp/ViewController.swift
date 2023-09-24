//
//  FirstTableViewViewController.swift
//  TableViewCourse
//
//  Created by Дмитрий Пономарев on 16.09.2022.
//


import UIKit
import SnapKit

let modelForTableViewModels: [Model] = [
    Model(restorantName: "Птичка Невеличка", imageOfRestorant: "ptichka.jpeg"),
    Model(restorantName: "Балерина и Бифштекс", imageOfRestorant: "balerin.jpeg"),
    Model(restorantName: "Пинокио Джан", imageOfRestorant: "pinokio.jpeg"),
    Model(restorantName: "Бастурма", imageOfRestorant: "basturma.jpeg")
]





class FirstTableViewViewController: UIViewController {
    
    
    //MARK: - UI properties
    let tableview = UITableView()
    let navigBar = UINavigationBar()

    
    
    //MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        addViews()
        makeConstraints()
        setupViews()
        setupAction()
    }
    
    //MARK: - objc method
}

private extension FirstTableViewViewController {
    
    //MARK: - addViews
    
    func addViews() {
        view.addSubview(tableview)
        view.addSubview(navigBar)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(CellForTableViewTableViewCell.self, forCellReuseIdentifier: CellForTableViewTableViewCell.identifier)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {

        navigBar.snp.makeConstraints {
            $0 .width.equalToSuperview()
            $0 .top.equalToSuperview().inset(40)
        }
        tableview.snp.makeConstraints {
            $0 .bottom.left.right.equalToSuperview()
            $0 .top.equalTo(navigBar.snp.bottom)
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        setupNavBar()
    }
    
    //MARK: - setupNavBar
    
    func setupNavBar() {
        let navItem = UINavigationItem(title: "Restorants")
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(dissmissView))
        navItem.rightBarButtonItem = doneItem
        navigBar.setItems([navItem], animated: false)
    }
    
    @objc func dissmissView() {
        let secondView = NewObjectViewController()
        let upperBar = UINavigationController (rootViewController: secondView)
        upperBar.navigationBar.backgroundColor = .gray
        upperBar.modalPresentationStyle = .fullScreen
        present (upperBar, animated: true)
    }
    
    //MARK: - setupAction
    
    func setupAction() {
        
        
    }
}

//      MARK: - extension UITableViewDataSource

extension FirstTableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelForTableViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CellForTableViewTableViewCell.identifier, for: indexPath) as? CellForTableViewTableViewCell else {
            return UITableViewCell() }
        let cellWithModel = modelForTableViewModels [indexPath.row]
        cell.configureView (cellWithModel)
        return cell
    }
    
    
}

extension FirstTableViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        let example = modelForTableViewModels [indexPath.row]
        let SecondVC: UIViewController = SecondViewController(items: example)
        self.navigationController?.pushViewController (SecondVC, animated: true)
        present(SecondVC, animated: true)
    }
}



