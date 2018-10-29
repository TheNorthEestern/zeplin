//
//  AchievementResultModel.swift
//  zeplin
//
//  Created by Kacy James on 10/28/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

struct AchievementResultModel: Codable {
  let success: Bool
  let status: Int
  let overview: OverviewModel
  let achievements: [AchievementModel]
}
