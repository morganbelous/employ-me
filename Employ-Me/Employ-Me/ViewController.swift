//
//  ViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

/*protocol addJobDelegate: class {
    func postJob(newTitle: String, newName: String, newEmail: String, newPrice: String, newBio: String /*, newPicture: UIImage */)
} */

class ViewController: UIViewController {
    
    var jobCollectionView: UICollectionView!
    var jobs: [Job]!
    var filteredJobs: [Job] = []
    var searchBar: UISearchBar!
    var isSearching: Bool! = false
    var signOutButton: UIButton!
    
    let jobCellReuseIdentifier = "jobCellReuseIdentifier"
    let sidePadding: CGFloat = 8
    let topPadding: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadJobs), name: NSNotification.Name("Reload Jobs"), object: nil)
        
        self.navigationItem.setHidesBackButton(true, animated: true);


        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = topPadding
        layout.minimumInteritemSpacing = topPadding
        
        searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search by job type"
        let searchBarText = searchBar.value(forKey: "searchField") as? UITextField
        searchBarText?.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        signOutButton = UIButton()
        signOutButton.backgroundColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.layer.cornerRadius = 10
        signOutButton.addTarget(self, action: #selector(didTapSignOut(_:)), for: .touchUpInside)
        view.addSubview(signOutButton)
        
        //let job1 = Job(title: "Artist", name: "Sam White", email: "stw34@cornell.edu", price: "price varies", bio: "Hi everyone! My name is Sam and I have been making artwork for as long as I can remember. If you would a portrait done, some artwork for you wall, or anything in between, reach out! I have reasonable prices." /*, picture: UIImage(named: "artist.jpg")!*/)
        //let job2 = Job(title: "Physics Tutor", name: "Matt Smith", email: "mes3@cornell.edu", price: "$20 an hour", bio: "I am a junior physics major in the College of Arts and Sciences. I am offering tutoring for the following classes: PHYS 1112, PHYS 2213, and PHYS 2214. I am willing to meet up at any place and I am very flexible on times. Reach out if you're interested!" /*, picture: UIImage(named: "physics-tutor.jpg")!*/)
        //let job3 = Job(title: "Makeup Artist", name: "Victoria Jones", email: "vlj234@cornell.edu", price: "price varies", bio: "Hello! My name is Victoria and I have a passion for makeup. I love helping people feel more confident by enhancing their natural beauty. I am very experienced with all types of looks, from natural, to full coverage, to special artwork. If you have a date night, photoshoot, or anything else special coming up, I would love to help! I am willing to travel anywhere on Cornell's campus to get to a client." /*, picture: UIImage(named: "makeup-artist.jpg")! */)
        //let job4 = Job(title: "Web Designer", name: "Amanda Chen", email: "aec455@cornell.edu", price: "price varies", bio: "Hi! My name is Amanda and I love web design. I love making websites accessible to all users and making them aesthetically pleasing. I love graphic design, drawing, and painting. Being a senior information science major, I have a lot of experience working with clients. I love making people's visions come to life! If you need a web or mobile app designer, please reach out!" /*, picture: UIImage(named: "web-designer.jpg")! */)
        
        //jobs = [job1, job2, job3, job4]
        jobs = []
        jobs.sort{$0.title < $1.title}
        
        filteredJobs = jobs
        
        jobCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        jobCollectionView.backgroundColor = .white
         jobCollectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: jobCellReuseIdentifier)
        jobCollectionView.dataSource = self
        jobCollectionView.delegate = self
        view.addSubview(jobCollectionView)
        
        setUpConstraints()
        getJobs()
    }
    
    func setUpConstraints(){
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalTo(view).inset(UIEdgeInsets(top: 0, left: sidePadding, bottom: 0, right: 100))
            make.height.equalTo(40)
        }
        
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view).offset(-sidePadding)
            make.left.equalTo(searchBar.snp.right)
            make.height.equalTo(40)
        }
        
        jobCollectionView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 70, left: sidePadding, bottom: 0, right: sidePadding))
        }
    }
    
    func getJobs(){
        NetworkManager.getJobs() { jobs in
            self.jobs = jobs
            DispatchQueue.main.async {
                self.jobCollectionView.reloadData()
            }
        }
    }
    
    @objc func reloadJobs() {
        getJobs()
    }
    
    @objc func pushDetailsViewController(){
        if let indexPath = self.jobCollectionView.indexPathsForSelectedItems?.first{
            let job = jobs[indexPath.row]
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

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filteredJobs.count
        }
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = jobCollectionView.dequeueReusableCell(withReuseIdentifier: jobCellReuseIdentifier, for: indexPath) as! JobCollectionViewCell
        if isSearching {
            let job = filteredJobs[indexPath.item]
            cell.configure(for: job)
            return cell
        } else {
            let job = jobs[indexPath.item]
            cell.configure(for: job)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width * 0.4
        return CGSize(width: width, height: height)
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushDetailsViewController()
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredJobs.removeAll(keepingCapacity: false)
        let predicateString = searchBar.text!
        filteredJobs = jobs.filter({$0.title.range(of: predicateString, options: .caseInsensitive) != nil})
        filteredJobs.sort{$0.title < $1.title}
        isSearching = (filteredJobs.count == 0) ? false: true
        jobCollectionView.reloadData()
    }
}

/*extension ViewController: addJobDelegate{
    func postJob(newTitle: String, newName: String, newEmail: String, newPrice: String, newBio: String /*, newPicture: UIImage */) {
        let newJob = Job(title: newTitle, name: newName, email: newEmail, price: newPrice, bio: newBio /*, picture: newPicture */)
        jobs.append(newJob)
        jobCollectionView.reloadData()
    }
    
} */


extension ViewController: AddJobViewControllerDelegate {
    func willBeDismissed() {
        //reloadJobs()
        self.jobCollectionView.reloadData()
    }
}


