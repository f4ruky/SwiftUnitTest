//
//  SwiftTestUITests.swift
//  SwiftTestUITests
//
//  Created by Faruk Yaşar on 7.04.2023.
//

import XCTest

final class SwiftTestUITests: XCTestCase {

    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftTest.View"].buttons["Add"]
               
               let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
               
               let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
               
               let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
               
               
               addButton.tap()
               textField.tap()
               textField.typeText("my to do")
               okBUtton.tap()
               
               XCTAssertTrue(addedCell.exists)
               
    }

    func testDeleteItem() throws{
        
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftTest.View"].buttons["Add"]
               
               let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
               
               let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
               
               let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
            
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
               
               addButton.tap()
               textField.tap()
               textField.typeText("learn Swift")
               okBUtton.tap()
        
        
       
       addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
        
        
        
                        
       
    }

    
}
