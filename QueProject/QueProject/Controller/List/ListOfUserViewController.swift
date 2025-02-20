//
//  ListOfUserViewController.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import UIKit
import Alamofire

final class ListOfUserViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of user"
        configCollectionView()
        Task {
            await fetchUser()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView.collectionViewLayout = layout
    }
    
    private func fetchUser() async {
        do {
            users = try await UserService.shared.getListUser()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch let error as NetworkError {
            DispatchQueue.main.async {
                self.showErrorAlert(error: error)
            }
        } catch {
            DispatchQueue.main.async {
                self.showErrorAlert(message: "An unknown error occurred.")
            }
        }
    }
    
    private func showErrorAlert(error: NetworkError) {
        var message: String
        switch error {
        case .badResponse(let errorMessage):
            message = errorMessage
        default:
            message = "Something went wrong"
        }
        showErrorAlert(message: message)
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController?.present(alert, animated: true)
    }
}

extension ListOfUserViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCollectionViewCell
        cell.updateUI(urlString: users[indexPath.row].avatar ?? "")
        return cell
    }
}
