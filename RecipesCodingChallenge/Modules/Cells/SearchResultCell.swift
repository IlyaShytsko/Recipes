//
//  SearchResultCell.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import UIKit
import Kingfisher

final class SearchResultCell: UITableViewCell {
    
    @IBOutlet private weak var recipeLabel: UILabel!
    @IBOutlet private weak var recipeImageView: UIImageView!
    
    override func prepareForReuse() {
        recipeImageView.image = nil
        recipeImageView.kf.indicatorType = .activity
    }
    
    var model: SearchModel.Recipe? {
        didSet {
            guard let model else { return }
            recipeLabel.text = model.label
            recipeImageView.kf.setImage(with: model.image?.encodedUrl, options: [.transition(.fade(0.3)), .loadDiskFileSynchronously])
            recipeImageView.roundCorners(radius: 10)
        }
    }
}
