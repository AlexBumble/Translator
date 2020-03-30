//
//  WordsMeaningView.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct MeaningView: View {

    let text: String
    let imageSize = UIScreen.main.bounds.width * 0.7
    @EnvironmentObject var viewModel: MeaningViewModel
    
    var body: some View {
        VStack {
            if viewModel.isImageLoading {
                Spacer()
                ActivitiyIndicator()
                Spacer()
            }  else {
                Spacer()
                HStack {
                    Text("\(text)")
                        .bold()
                    Text(" means:")
                        .fontWeight(.light)
                    Text(viewModel.meanings[0].translation.text)
                        .bold()
                }
                Spacer()
                Image(uiImage: viewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize, alignment: .center)
                    .padding(16)
                Spacer()
                Spacer()
            }
        }
    }

}

struct WordsMeaningView_Previews: PreviewProvider {
    static var previews: some View {
        MeaningView(text: "Example")
    }
}
