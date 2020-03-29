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
                if viewModel.isPageLoading && viewModel.translatePage == 1 {
                    Spacer()
                    ActivitiyIndicator()
                    Spacer()
                } else {
                    posibleTranslationList
                }
            }
            .navigationBarTitle(
                "Searching",
                displayMode: .inline)
        }
    }
    
    private var posibleTranslationList: some View {
        List(viewModel.dataSource) { item in
            NavigationLink(destination: self.createCellDestination(item.meanings)) {
                self.createSearchWordsCell(item)
            }
        }
    }
    
    private func createCellDestination(_ data: [Meaning]) -> some View {
        LazyView(
            WordsMeaningView()
                .environmentObject(WordsMeaningViewModel(meanings:  data)))
    }
    
    private func createSearchWordsCell(_ possibleTranslation: PosibleTranslation) -> some View {
        SearchWordsCell(possibleTranslation: possibleTranslation)
            .onAppear() {
                if self.viewModel.dataSource.isLast(possibleTranslation) {
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

