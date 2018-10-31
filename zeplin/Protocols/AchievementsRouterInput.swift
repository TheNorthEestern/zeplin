//
//  AchievementsRouterInput.swift
//  zeplin
//
//  Created by Kacy James on 10/30/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

protocol AchievementsRouterInput: class {
  func presentDetailsInterfaceForAchievement(achievement: AchievementModel)
}
