//
//  WordsMeaningView.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct WordsMeaningView: View {
    
    @EnvironmentObject var viewModel: WordsMeaningViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.meaning[0].translation.text)
                .padding(.top, 16)
            Spacer()
            if viewModel.isImageLoading {
                Spacer()
                ActivitiyIndicator()
                Spacer()
            } else {
                Spacer()
                ImageView(image: viewModel.image)
                    .padding(16)
                Spacer()
            }
        }
    }
}

struct WordsMeaningView_Previews: PreviewProvider {
    static var previews: some View {
        WordsMeaningView()
    }
}
