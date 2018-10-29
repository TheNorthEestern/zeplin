//
//  ViewController.swift
//  zeplin
//
//  Created by Kacy James on 10/28/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
      if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.mappedIfSafe) {
        do {
          let item: AchievementResultModel = try JSONDecoder().decode(AchievementResultModel.self, from: jsonData)
          print(String(describing: item))
        } catch let error {
          print("There was an error: \(error.localizedDescription)")
        }
      }
    }
  }


}

