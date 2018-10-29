//
//  AchievementModel.swift
//  zeplin
//
//  Created by Kacy James on 10/28/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import Foundation

struct AchievementModel: Codable {
  let id: Int
  let level: String
  let progress: Int
  let total: Int
  let bgImageUrl: URL?
  let accessible: Bool
  
  enum CodingKeys: String, CodingKey {
    case id
    case level
    case progress
    case total
    case bgImageUrl = "bg_image_url"
    case accessible
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    level = try container.decode(String.self, forKey: .level)
    progress = try container.decode(Int.self, forKey: .progress)
    total = try container.decode(Int.self, forKey: .total)
    bgImageUrl = try container.decodeIfPresent(URL.self, forKey: .bgImageUrl)
    accessible = try container.decode(Bool.self, forKey: .accessible)
  }
}
