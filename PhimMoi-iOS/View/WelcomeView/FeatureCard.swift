//
//  FeatureCard.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 16/09/2022.
//

import SwiftUI
import Kingfisher

let url = "https://wallpaperaccess.com/full/1103705.jpg"
let url1 = "https://wallpapercave.com/wp/wp3776241.jpg"
let title = "Cinderella"


struct FeatureCard: View {
    
    var body: some View {
        ZStack {
            KFImage(URL(string: url1)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
            VStack (){
                Spacer()
                Text("THE NUTCRACKER AND THE FOUR REALMS")
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
        
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard()
    }
}
