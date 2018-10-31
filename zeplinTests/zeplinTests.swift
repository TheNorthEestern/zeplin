//
//  zeplinTests.swift
//  zeplinTests
//
//  Created by Kacy James on 10/28/18.
//  Copyright © 2018 Kacy James. All rights reserved.
//

import XCTest
@testable import zeplin

class zeplinTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAchievementResultModelDoesDecode() {
    let json = """
    {
      "success": true,
      "status": 200,
      "overview": {
        "title": "The Test Passed"
      },
      "achievements": [
      {
        "id": 3,
        "level": "2",
        "progress": 0,
        "total": 50,
        "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png",
        "accessible": false
      }
      ]
    }
    """
    guard let data = json.data(using: .utf8) else {
      XCTFail("Couldn't initialize data")
      return
    }
    
    do {
      let result = try JSONDecoder().decode(AchievementResultModel.self, from: data)
      XCTAssertTrue(result.success == true)
      XCTAssertTrue(result.overview.title == "The Test Passed")
      XCTAssertTrue(!result.achievements.isEmpty)
    } catch let error {
      XCTFail(String(describing: error))
    }
  }
  
  func testAchievementModelDoesDecode() {
    let json = """
    {
    "id": 3,
    "level": "2",
    "progress": 0,
    "total": 50,
    "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png",
    "accessible": false
    }
    """
    guard let data = json.data(using: .utf8) else {
      XCTFail("Couldn't initialize data")
      return
    }
    
    do {
      let result = try JSONDecoder().decode(AchievementModel.self, from: data)
      XCTAssertTrue(result.id == 3)
      XCTAssertTrue(result.level == "2")
      XCTAssertTrue(result.progress == 0)
      XCTAssertTrue(result.total == 50)
      XCTAssertTrue(result.bgImageUrl == URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png"))
      XCTAssertTrue(result.accessible == false)
    } catch let error {
      XCTFail(String(describing: error))
    }
  }
  
  func testOverViewModelDoesDecode() {
    let json = """
    {
        "title": "The Test Passed"
    }
    """
    guard let data = json.data(using: .utf8) else {
      XCTFail("Couldn't initialize data")
      return
    }
    
    do {
      let result = try JSONDecoder().decode(OverviewModel.self, from: data)
      XCTAssertTrue(result.title == "The Test Passed")
    } catch let error {
      XCTFail(String(describing: error))
    }
  }
}
