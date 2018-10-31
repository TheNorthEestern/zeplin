//
//  AchievementTableViewCell.swift
//  zeplin
//
//  Created by Kacy James on 10/30/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {
  
  @IBOutlet weak var levelNumberLabel: UILabel!
  @IBOutlet weak var achievementProgressBar: UIProgressView!
  @IBOutlet weak var achivementBackgroundImageView: UIImageView!
  @IBOutlet weak var achievementStartRangeLabel: UILabel!
  @IBOutlet weak var achievementEndRangeLabel: UILabel!
  @IBOutlet weak var achievementAccessibilityView: UIView!
  @IBOutlet weak var achievementShadowBackgroundView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    achivementBackgroundImageView.layer.cornerRadius = 10
    achivementBackgroundImageView.layer.masksToBounds = true
    achievementShadowBackgroundView.layer.masksToBounds = false
    achievementShadowBackgroundView.layer.shadowOffset = CGSize(width: 2, height: 0)
    achievementShadowBackgroundView.layer.shadowRadius = 5
    achievementShadowBackgroundView.layer.shadowOpacity = 0.5
   
   achievementShadowBackgroundView.layer.shadowColor = UIColor.gray.cgColor
    
    achievementShadowBackgroundView.layer.cornerRadius = 10
    achievementShadowBackgroundView.layer.backgroundColor = UIColor.black.cgColor
  }
  
  func configure(with achievement: AchievementModel) {
    levelNumberLabel.text = achievement.level
    achievementStartRangeLabel.text = "\(achievement.progress)pts"
    achievementEndRangeLabel.text = "\(achievement.total)pts"
    achievementProgressBar.progress = Float(achievement.progress) / Float(achievement.total)
    achievementAccessibilityView.isHidden = achievement.accessible
    achievementShadowBackgroundView.isHidden = !achievement.accessible
    if let url = achievement.bgImageUrl {
      downloadImage(from: url)
    }
  }
  
  private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  private func downloadImage(from url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      DispatchQueue.main.async() {
        self.achivementBackgroundImageView.image = UIImage(data: data)
      }
    }
  }
  
}
