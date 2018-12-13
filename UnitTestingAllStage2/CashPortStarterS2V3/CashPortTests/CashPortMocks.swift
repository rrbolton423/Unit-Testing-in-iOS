//
//  CashPortMocks.swift
//  CashPortTests
//
//  Created by Romell Bolton on 12/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import XCTest
@testable import CashPort

class CashPortMocks: XCTestCase {
    
    let networkingController = NetworkingController()
    let mockNotificationCenter = MockNotificationCenter()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        networkingController.notificationCenter = mockNotificationCenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        networkingController.notificationCenter = NotificationCenter.default
    }
    
    func testPostAlertNotification() {
        
        networkingController.postAlertNotification()
        
        XCTAssertTrue(mockNotificationCenter.didRecieveUserDataNotification, "UserDataAlert notification NOT sent")
    }

    class MockNotificationCenter: NotificationCenter {
        
        var didRecieveUserDataNotification = false
        
        override func post(name aName: NSNotification.Name, object anObject: Any?) {
            
            if aName == NSNotification.Name(rawValue:"UserDataAlert") {

                didRecieveUserDataNotification = true
            }
        }
    }

}
