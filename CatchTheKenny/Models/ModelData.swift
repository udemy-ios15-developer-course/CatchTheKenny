//
//  ModelData.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//
import Foundation

final class ModelData {
    var highScores = [HighScore]()
    
    func loadScores() -> [HighScore] {
        guard let rawScores = UserDefaults.standard.object(forKey: "highscores") as? Data
        else {
            var newSet = [HighScore]()
            newSet.append(HighScore(initials:"aaa", score:5))
            newSet.append(HighScore(initials:"bbb", score:4))
            newSet.append(HighScore(initials:"ccc", score:3))
            newSet.append(HighScore(initials:"ddd", score:2))
            newSet.append(HighScore(initials:"eee", score:1))
            return newSet
        }
        
        let decoder = JSONDecoder()
        highScores = try! decoder.decode([HighScore].self, from: rawScores)
        return highScores
    }
    
    func saveScores() {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(highScores)
        UserDefaults.standard.set(data, forKey: "highscores")
    }
}


