//
//  IdentifiableExtensions.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

extension String: Identifiable {
    public var id: UUID { UUID() }
}

extension PosibleTranslation: Identifiable {
    public var id: String {
        self.text
    }
}
