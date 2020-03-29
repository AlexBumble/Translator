//
//  SearchBarView.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
    
    let barText: String
    @State var input: String = ""
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            HStack {
                Spacer(minLength: 16)
                Image(systemName: "magnifyingglass")
                Spacer(minLength: 8)
                TextField(barText, text: $input, onCommit: {
                    self.searchText = self.input
                })
                Spacer(minLength: 8)
                if !self.input.isEmpty {
                    Image(systemName: "multiply.circle")
                        .onTapGesture {
                            self.input = ""
                            self.searchText = ""
                    }
                }
                Spacer(minLength: 16)
            }
            .padding(.vertical, 8)
        }
        .cornerRadius(30)
        .overlay(RoundedRectangle(cornerRadius: 30)
        .stroke(Color.gray, lineWidth: 2))
        .padding(8)
    }
    
}

struct SearchingView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchBarView(barText: "SearchingView_Preview",searchText: .constant(""))
    }
}

