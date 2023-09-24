//
//  NewObjectViewController.swift
//  petshelp
//
//  Created by Дмитрий Пономарев on 18.09.2022.
//


import UIKit
import SnapKit


class NewObjectViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    //MARK: - UI properties
    let navigBar = UINavigationBar()
    let addImage = UIImageView()
    let nameLabel = UILabel()
    let locationLabel = UILabel()
    let typeLabel = UILabel()
    let nameTF = UITextField()
    let locationTF = UITextField()
    let typeTF = UITextField()
    
    
    
    
    
    
    
    
    
    
//    MARK: - Make StackView
    
    
 
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
  
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)

        
    }

  
    //MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addViews()
        makeConstraints()
        setupViews()
        setupAction()
        view.backgroundColor = .systemGray4
    }
    
    //MARK: - objc method
}

private extension NewObjectViewController {
    
    //MARK: - addViews
    
    func addViews() {
        view.addSubview(addImage)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(typeLabel)
        view.addSubview(nameTF)
        view.addSubview(locationTF)
        view.addSubview(typeTF)
        view.addSubview(navigBar)
    }
    
    //MARK: - makeConstraints
                        
    func makeConstraints() {
        navigBar.snp.makeConstraints {
            $0 .width.equalToSuperview()
            $0 .top.equalToSuperview().inset(40)
        }
        addImage.snp.makeConstraints {
            $0 .top.equalTo(navigBar.snp.bottom)
            $0 .right.left.equalToSuperview()
            $0 .height.equalTo(300)
        
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        setupNavBar()
        addImage.image = UIImage(named: "addImage")
        addImage.contentMode = .center
        addImage.backgroundColor = .white
        nameLabel.text = "Restorant Name"
        nameLabel.font = .boldSystemFont(ofSize: 25)
        nameLabel.textColor = .gray
        nameTF.borderStyle = .roundedRect
        nameTF.placeholder = "Print Restorant Name"
        nameTF.textColor = .black
        locationLabel.text = "Restorant Location"
        locationLabel.font = .boldSystemFont(ofSize: 25)
        locationLabel.textColor = .gray
        locationTF.borderStyle = .roundedRect
        locationTF.placeholder = "Print Restorant Location"
        locationTF.textColor = .black
        typeLabel.text = "Restorant Type"
        typeLabel.font = .boldSystemFont(ofSize: 25)
        typeLabel.textColor = .gray
        typeTF.borderStyle = .roundedRect
        typeTF.placeholder = "Print Restorant Type"
        typeTF.textColor = .black
    }
    
    //MARK: - setupNavBar
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - setupAction
    
    func setupAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NewObjectViewController.imageTapped(gesture:)))
        addImage.addGestureRecognizer(tapGesture)
        addImage.isUserInteractionEnabled = true
    }

    @objc func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.cameraPicker(source: .camera)
            }
            let library = UIAlertAction(title: "Library", style: .default) {_ in
                self.pickPhoto()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            actionSheet.addAction(camera)
            actionSheet.addAction(cancel)
            actionSheet.addAction(library)
            present(actionSheet, animated: true)

        }
    }
}

//      MARK: - extension chooseImagePicker
extension NewObjectViewController {
    
    func cameraPicker (source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func pickPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    {
        
        addImage.image = (info[.editedImage] as? UIImage)
        addImage.contentMode = .scaleAspectFill
        addImage.clipsToBounds = true
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    }

