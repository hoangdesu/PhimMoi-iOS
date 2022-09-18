//
//  CategoryView.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: TaylorSwiftUI
  ID:
     - Nguyen Quoc Hoang - s3697305
     - Nguyen Tan Huy - s3864185
     - Nguyen Minh Duy Uyen - s3819342
     - Le Ngoc Duy - s3757327
  Created  date: 31/08/2022
  Last modified: 18/09/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var movieVM: MovieViewModel
    
    var headline: String
    @State var movieList: [Movie]
    
    var body: some View {
        VStack {
            HStack {
                Text(self.headline)
                    .modifier(CategogyTextModifier())
                Spacer()
            }
            .padding(10)
            .padding(.trailing, 20)
            .padding(.leading, 20)
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 20) {
                    
                    ForEach(self.movieList, id: \.id) { movie in
                        PosterCard(movie: movie)
                    }
                    
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
        }
        
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(headline: "Action")
//    }
//}
