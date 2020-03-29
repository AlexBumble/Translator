//
//  Meaning.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

struct Meaning: Codable {
    
    var translation: MeaningTranslation
    var imageUrl: String?
    
    init(translation: MeaningTranslation, imageUrl: String) {
        self.translation = translation
        self.imageUrl = imageUrl
    }
    
}
