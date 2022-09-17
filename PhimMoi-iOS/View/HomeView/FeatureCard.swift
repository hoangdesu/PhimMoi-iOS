//
//  FeatureCard.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher



struct FeatureCard: View {
    @State var showDetail = false
    var body: some View {
        ZStack {
            KFImage(URL(string: mockMovie.posterPath!)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
            
            VStack (){
                Spacer()
                Text(mockMovie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .lineSpacing(3)
                    .padding(20)
//                    .padding(.leading, 20)
                    .padding(.trailing, 50)
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
            DetailView(movie: mockMovie)
        }
        
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard()
    }
}
