//
//  SearchWordsView.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct SearchWordsView: View {
    
    @EnvironmentObject var viewModel: SearchWordsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(barText: "Search english words for translate",
                              searchText: $viewModel.searchText)
				// ActivitiyIndicator while downloading
                if viewModel.isPageLoading && viewModel.translatePage == 1 {
                    Spacer()
                    ActivitiyIndicator()
                    Spacer()
                } else {
                    translationList
                }
            }
            .navigationBarTitle(
                "Searching",
                displayMode: .inline)
        }

    }
    
    private var translationList: some View {
        List(viewModel.dataSource) { item in
            NavigationLink(destination: self.meaningDestination(with: item)) {
                self.createTranslationCell(item)
            }
        }
    }
    
	// Cell's NavigationLink's destination
    private func meaningDestination(with data: PosibleTranslation) -> some View {
        LazyView(
            MeaningView(text: data.text)
                .environmentObject(MeaningViewModel(meanings:  data.meanings)))
    }
    
	// Paging
    private func createTranslationCell(_ translation: PosibleTranslation) -> some View {
        TranslationCell(translation: translation)
            .onAppear() {
                if self.viewModel.dataSource.isLast(translation) {
                    self.viewModel.loadNewPage()
                }
        }
    }
}

struct SearchWordsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWordsView()
            .environmentObject(SearchWordsViewModel())
    }
}

