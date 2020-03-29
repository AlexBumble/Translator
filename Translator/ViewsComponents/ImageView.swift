//
//  ImageView.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI

struct ImageView: UIViewRepresentable {
    
    private var image: UIImage?
    private var view: UIImageView
    
    init(image: UIImage?) {
        self.image = image
        self.view = UIImageView()
    }
    
    func makeUIView(context:
        UIViewRepresentableContext<ImageView>) -> UIImageView {
        return view
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        view.image = image
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: nil)
    }
}
