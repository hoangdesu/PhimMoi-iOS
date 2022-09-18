//
//  FeatureCard.swift
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
import Kingfisher

struct FeatureCard: View {
    
    let movie: Movie
    @State var showDetail = false
    
    var body: some View {
        ZStack {
            KFImage(URL(string: movie.posterPath!)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .lineSpacing(3)
                    .padding(20)
                    .padding(.trailing, 50)
                    .frame(width: 280, alignment: .leading)
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(15)
        .shadow(color: Color.gray, radius: 15, x: 0, y: 10)
        .padding(.bottom, 15)
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            DetailView(movie: movie)
        }
        
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(movie: mockMovie)
    }
}
