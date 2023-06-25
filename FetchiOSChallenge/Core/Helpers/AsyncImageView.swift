//
//  AsyncImageView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { image in
                image.resizable()
                    .background(.orange)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://www.themealdb.com/images/media/meals/1550442508.jpg")
        AsyncImageView(url: url)
    }
}
