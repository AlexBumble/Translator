//
//  SearchWordsViewModel.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Combine

final class SearchWordsViewModel: ObservableObject {
    
    private var searchTextLast = ""
    private var pageLastValue = 0
    private let skyengAPI: Translatable
    private var disposables = Set<AnyCancellable>()
    @Published var searchText = ""
    @Published private(set) var translatePage: Int = 1
    @Published private(set) var dataSource: [PosibleTranslation] = []
    @Published private(set) var isPageLoading: Bool = false
    
    init() {
        self.skyengAPI = SkyengAPI()
        $searchText
            .dropFirst()
            .sink (receiveValue: { searchText in
                self.loadPage(with: searchText)
            })
            .store(in: &disposables)
    }
    
    func loadNewPage() {
        translatePage += 1
        loadPage(with: searchText)
    }
    
    func loadPage(with searchText: String) {
        if searchText.isEmpty {
            clearVariablesAndStorage()
            return
        }
        if isPageLoading == false {
            isPageLoading = true
            skyengAPI.translate(search: searchText, page: translatePage, pageSize: 20)
            { (response, error) in
                guard let posibleTranslation = response else {
                    print("Error in \(#file), \(#function), \(#line) can't unwrap.")
                    return
                }
                
                self.UpdateDataSource(
                    data: posibleTranslation,
                    sesearchText: searchText,
                    page: self.translatePage)
                
                self.searchTextLast = searchText
                self.pageLastValue = self.translatePage
                self.isPageLoading = false
            }
        }
    }

    private func clearVariablesAndStorage() {
        dataSource.removeAll()
        translatePage = 1
        searchTextLast = ""
    }
    
    private func UpdateDataSource(
        data: [PosibleTranslation],
        sesearchText: String,
        page: Int)
    {
        if searchTextLast != searchText {
            translatePage = 1
            dataSource.removeAll()
        } else if page == pageLastValue {
            return
        }
        dataSource.append(contentsOf: data)
    }
}
