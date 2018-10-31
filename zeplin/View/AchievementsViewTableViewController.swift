//
//  AchievementsViewTableViewController.swift
//  zeplin
//
//  Created by Kacy James on 10/29/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import UIKit

class AchievementsViewTableViewController: UITableViewController {
  
  var presenter: AchievementsModuleInterface!
  var achievementResult: AchievementResultModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter = AchievementsPresenter()
    (presenter as! AchievementsPresenter).view = self
    presenter.updateView()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return achievementResult.achievements.count
  }
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementViewCell", for: indexPath) as? AchievementTableViewCell else {
      return super.tableView(tableView, cellForRowAt: indexPath)
    }
    cell.configure(with: achievementResult.achievements[indexPath.row])
    return cell
   }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return super.tableView(tableView, heightForRowAt: indexPath)
  }
 
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension AchievementsViewTableViewController: AchievementsViewInterface {
  func showAchievementData(achievementResult: AchievementResultModel) {
    self.achievementResult = achievementResult
    self.title = self.achievementResult.overview.title
    self.tableView.reloadData()
  }
}
