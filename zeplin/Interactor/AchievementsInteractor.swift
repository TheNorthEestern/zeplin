//
//  AchievementsInteractor.swift
//  zeplin
//
//  Created by Kacy James on 10/30/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

class AchievementsInteractor: AchievementsInteractorInput {
  weak var output: AchievementsInteractorOutput!
  
  func readAchievements() {
    if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
      if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.mappedIfSafe) {
        do {
          let achievementResult = try JSONDecoder().decode(AchievementResultModel.self, from: jsonData)
          self.output.achievementsFetched(achievements: achievementResult.achievements)
        } catch let error {
          print("There was an error: \(error.localizedDescription)")
        }
      }
    }
  }
}
