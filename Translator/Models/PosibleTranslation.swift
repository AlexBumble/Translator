//
//  PosibleTranslation.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

struct PosibleTranslation: Codable {
    
    var text: String
    var meanings: [Meaning]
    
    init(text: String, meanings: [Meaning]) {
        self.text = text
        self.meanings = meanings
    }
    
}
