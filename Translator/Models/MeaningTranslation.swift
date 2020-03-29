//
//  MeaningTranslation.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

struct MeaningTranslation: Codable {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
}
