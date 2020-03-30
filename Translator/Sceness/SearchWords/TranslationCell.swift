//
//  TranslationCell.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct TranslationCell: View {
    
    let translation: PosibleTranslation
    @EnvironmentObject var viewModel: SearchWordsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Possible translation:")
                    .fontWeight(.light)
                    .fixedSize()
                Text(translation.text)
                    .bold()
            }
            .padding(.horizontal, 8)
            if self.viewModel.isPageLoading && self.viewModel.dataSource.isLast(translation) {
                Divider()
                ActivitiyIndicator()
            }
        }
        
    }
    
}

struct SearchWordsCell_Previews: PreviewProvider {
    static var previews: some View {
        TranslationCell(translation: PosibleTranslation(text: "transport system workstation", meanings: [])).environmentObject(SearchWordsViewModel())
    }
}
