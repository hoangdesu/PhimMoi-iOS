//
//  MovieRow.swift
//  PhimMoi-iOS
//
//  Created by Uyen Nguyen Minh Duy on 15/09/2022.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    var body: some View {
        HStack {
            Text(movie.title)

        }.padding(10)
            
    }
}

//struct MovieRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieRow()
//    }
//}
