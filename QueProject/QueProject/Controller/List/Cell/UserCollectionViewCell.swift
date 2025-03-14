//
//  UserCollectionViewCell.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import UIKit

final class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    func updateUI(urlString: String) {
        avatarImageView.loadImage(from: urlString)
    }
}
