//
//  ActivitiyIndicator.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct ActivitiyIndicator: UIViewRepresentable {
    
    func makeUIView(context:
        UIViewRepresentableContext<ActivitiyIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivitiyIndicator>)
    {
        uiView.startAnimating()
    }
    
}

struct ActivitiyIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiyIndicator()
    }
}

