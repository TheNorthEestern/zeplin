//
//  AchievementsInteractorOutput.swift
//  zeplin
//
//  Created by Kacy James on 10/30/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

protocol AchievementsInteractorOutput: class {
  func achievementsFetched(achievementResult: AchievementResultModel)
}
