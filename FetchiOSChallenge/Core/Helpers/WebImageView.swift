//
//  WebImageView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct WebImageView: View {
    let urlString: String
    
    var body: some View {
        if let url = URL(string: urlString) {
            WebImage(url: url)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
        } else {
            ProgressView()
                .frame(width: 100, height: 100)
        }
    }
}

struct WebImageView_Previews: PreviewProvider {
    static var previews: some View {
        WebImageView(urlString: "https://www.themealdb.com/images/media/meals/1550442508.jpg")
    }
}
