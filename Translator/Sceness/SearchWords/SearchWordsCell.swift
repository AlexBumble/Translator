//
//  SearchWordsCell.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct SearchWordsCell: View {
    
    let possibleTranslation: PosibleTranslation
    @EnvironmentObject var viewModel: SearchWordsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Possible translation:")
                    .fontWeight(.light)
                Text(possibleTranslation.text)
                    .bold()
            }
            .padding(.horizontal, 8)
            if self.viewModel.isPageLoading && self.viewModel.dataSource.isLast(possibleTranslation) {
                Divider()
                ActivitiyIndicator()
            }
        }
        
    }
    
}

struct SearchWordsCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchWordsCell(possibleTranslation: PosibleTranslation(text: "example", meanings: []))
    }
}
