//
//  RandomAccessCollectionExtsionsTestRandomAccessCollectionExtsionsTest.swift
//  RandomAccessCollectionExtsionsTestRandomAccessCollectionExtsionsTest
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import XCTest
@testable import Translator

class RandomAccessCollectionExtsionsTestRandomAccessCollectionExtsionsTest: XCTestCase {

    let posibleTranslations: [PosibleTranslation] = [
        PosibleTranslation(text: "go", meanings: []),
        PosibleTranslation(text: "cat", meanings: []),
        PosibleTranslation(text: "dog", meanings: []),
        PosibleTranslation(text: "home", meanings: []),
    ]

    func testIsLastEmpty() {
        let collection = [PosibleTranslation]()
        let item = PosibleTranslation(text: "item", meanings: [])
        
        let result = collection.isLast(item)
        XCTAssertFalse(result)
    }

    func testIsLastWorngItem() {
        let item = PosibleTranslation(text: "item", meanings: [])


        let result = posibleTranslations.isLast(item)
        XCTAssertFalse(result)
    }

    func testIsLastWithFirstElement() {
        let item = PosibleTranslation(text: "item", meanings: [])

        let result = posibleTranslations.isLast(item)
        XCTAssertFalse(result)
    }

    func testIsLastWithLastValue() {
        let item = PosibleTranslation(text: "home", meanings: [])

        let result = posibleTranslations.isLast(item)
        XCTAssertTrue(result)
    }
    
}
