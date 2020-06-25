//
//  ProfileViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/12/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

class ProfileViewController: UIViewController {
    
    var box: UIView!
    
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var addJobButton: UIButton!
    var name: String!
    var email: String!
    
    var myJobsCollectionView: UICollectionView!
    var myJobs: [Job]! = []
    let topPadding: CGFloat = 20
    let jobCellReuseIdentifier = "jobCellReuseIdentifier"
    
    init(name: String, email: String){
        self.name = name
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(didTapSignOut(_:)))
        
        box = UIView()
        box.backgroundColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        view.addSubview(box)
        
        nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font =  UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        emailLabel = UILabel()
        emailLabel.text = email
        emailLabel.font =  UIFont.boldSystemFont(ofSize: 16)
        emailLabel.textColor = .black
        view.addSubview(emailLabel)
        
        addJobButton = UIButton()
        addJobButton.backgroundColor = .black
        addJobButton.setTitle("+", for: .normal)
        addJobButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        addJobButton.layer.shadowColor = UIColor.black.cgColor
        addJobButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        addJobButton.layer.cornerRadius = 40 //half of height/width
        addJobButton.layer.shadowOpacity = 0.4
        addJobButton.layer.shadowRadius = 5
        addJobButton.addTarget(self, action: #selector(presentAddJobViewController), for: .touchUpInside)
        view.addSubview(addJobButton)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = topPadding
        layout.minimumInteritemSpacing = topPadding
        
        myJobsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myJobsCollectionView.backgroundColor = .white
        myJobsCollectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: jobCellReuseIdentifier)
        myJobsCollectionView.dataSource = self
        myJobsCollectionView.delegate = self
        view.addSubview(myJobsCollectionView)
        
        setupConstraints()
        getMyJobs()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//           navigationController?.setNavigationBarHidden(true, animated: animated)
//       }
    
    func setupConstraints() {
        box.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(view.frame.height * 0.4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        addJobButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerY.equalTo(box.snp.bottom)
            make.centerX.equalTo(view)
        }
        
        myJobsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(addJobButton.snp.bottom).offset(10)
            make.left.equalTo(view).offset(8)
            make.right.equalTo(view).offset(-8)
            make.bottom.equalTo(view)
        }
    }
    
    func getMyJobs(){
        NetworkManager.getJobs() { myJobs in
            self.myJobs = myJobs
            DispatchQueue.main.async {
                self.myJobsCollectionView.reloadData()
            }
        }
    }
    
    @objc func presentAddJobViewController(){
        let addJobViewController = AddJobViewController()
        addJobViewController.delegate = self
        present(addJobViewController, animated: true, completion: nil)
    }
    
    @objc func pushDetailsViewController(){
        if let indexPath = self.myJobsCollectionView.indexPathsForSelectedItems?.first{
            let job = myJobs[indexPath.row]
            let detailsViewController = DetailsViewController(jobTitle: job.title, jobName: job.name, jobEmail: job.email, jobPrice: job.price, jobBio: job.bio, jobImageName: job.imageName)
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        print("Signing out")
        GIDSignIn.sharedInstance().signOut()
        let loginController = SignInViewController()
        loginController.modalPresentationStyle = .fullScreen
        present(loginController, animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ProfileViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myJobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myJobsCollectionView.dequeueReusableCell(withReuseIdentifier: jobCellReuseIdentifier, for: indexPath) as! JobCollectionViewCell
            let job = myJobs[indexPath.item]
            cell.configure(for: job)
            return cell
        }
    }

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width * 0.4
        return CGSize(width: width, height: height)
    }
}

extension ProfileViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushDetailsViewController()
    }
}

extension ProfileViewController: AddJobViewControllerDelegate {
    func willBeDismissed() {
        getMyJobs()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "Reload Jobs"), object: nil)
    }
}



