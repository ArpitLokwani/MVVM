//
//  MovieViewModel.swift
//  MVVMYOUTUBE
//
//  Created by Arpit Lokwani on 10/03/19.
//  Copyright © 2019 Arpit Lokwani. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
   // D I
    
    init(movie:MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
    
}
