//
//  AchievementsPresenter.swift
//  zeplin
//
//  Created by Kacy James on 10/30/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

class AchievementsPresenter: AchievementsModuleInterface, AchievementsInteractorOutput {
  weak var view: AchievementsViewInterface!
  var interactor: AchievementsInteractorInput = AchievementsInteractor()
  var router = AchievementsRouter()
  
  func updateView() {
    (self.interactor as! AchievementsInteractor).output = self
    self.interactor.readAchievements()
  }
  
  func showDetailsForAchievement(achievement: AchievementModel) {
    self.router.presentDetailsInterfaceForAchievement(achievement: achievement)
  }
  
  func achievementsFetched(achievements: [AchievementModel]) {
    if !achievements.isEmpty {
      self.view.showAchievementData(achievements: achievements)
    }
  }
}
