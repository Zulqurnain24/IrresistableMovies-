//
//  Stub.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 29/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct Stub {

    static var movies: [MovieInfo] {
        
        let movie1 = MovieInfo(id: 19404, title: "Dilwale Dulhania Le Jayenge", overView: "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.", imageUrl: "https://image.tmdb.org/t/p/w500/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg", popularity: 17.113, votes: 2068, category: Category.topRatedMovies.rawValue)
        let movie2 = MovieInfo(id: 496243, title: "Parasite", overView: "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.", imageUrl: "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg", popularity: 29.103, votes: 496243, category: Category.topRatedMovies.rawValue)
        let movie3 = MovieInfo(id: 19404, title: "The Shawshank Redemption", overView: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.", imageUrl: "https://image.tmdb.org/t/p/w500/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg", popularity: 31.327, votes: 13279, category: Category.topRatedMovies.rawValue)
        
        return [movie1, movie2, movie3]
    }
    
    static var movieDetails: [MovieDetailInfo] {
        
        let movie1 = MovieDetailInfo(id: 1430, title: "Bowling for Columbine", originalTitle: "Bowling for Columbine", overview: "Why do 11,000 people die in America each year at the hands of gun violence? Talking heads yelling from every TV camera blame everything from Satan to video games. But are we that much different from many other countries? What sets us apart? How have we become both the master and victim of such enormous amounts of violence? This is not a film about gun control. It is a film about the fearful heart and soul of the United States, and the 280 million Americans lucky enough to have the right to a constitutionally protected Uzi. From a look at the Columbine High School security camera tapes to the home of Oscar-winning NRA President Charlton Heston, from a young man who makes homemade napalm with The Anarchist's Cookbook to the murder of a six-year-old girl by another six-year-old, Bowling for Columbine is a journey through America, through our past, hoping to discover why our pursuit of happiness is so riddled with violence.", tagLine: "One nation under the gun", imageEndpointString: "/bzGtoJ3Z0W4Y4xf3SMtnVFfhAHW.jpg", popularity: 8.43, votes: 788, imdbId: "tt0310793", releaseDate: "2002-10-09", genres: ["Documentary"], productionCompanies: ["Vif Babelsberger Filmproduktion GmbH & Co. Zweite KG of America", "Alliance Atlantis Communications", "Dog Eat Dog Films", "Iconolatry Productions Inc.", "Salter Street Films International", "TiMe Film- und TV-Produktions GmbH", "United Broadcasting Inc."], spokenLanguages: ["English"], runtime: 120, revenue: 35564473, voteAverage: 7.6, budget: 4000000, isAdult: false, homePage: "http://www.bowlingforcolumbine.com/index.php")
      
        return [movie1]
    }
}
