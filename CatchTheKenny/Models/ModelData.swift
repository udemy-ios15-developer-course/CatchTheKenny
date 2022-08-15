//
//  ModelData.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//
import Foundation

final class ModelData {
    var highScores = [HighScore]()
    var levelDetails = [LevelDetail]()
    
    func loadScores() {
        guard let rawScores = UserDefaults.standard.object(forKey: "highscores") as? Data
        else {
            var newSet = [HighScore]()
            newSet.append(HighScore(initials:"aaa", score:5))
            newSet.append(HighScore(initials:"bbb", score:4))
            newSet.append(HighScore(initials:"ccc", score:3))
            newSet.append(HighScore(initials:"ddd", score:2))
            newSet.append(HighScore(initials:"eee", score:1))
            highScores = newSet
            return
        }
        
        let decoder = JSONDecoder()
        highScores = try! decoder.decode([HighScore].self, from: rawScores)
    }
    
    func saveScores() {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(highScores)
        UserDefaults.standard.set(data, forKey: "highscores")
    }
    
    func loadLevels() {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: "GameLevels", withExtension: nil)
        else {
            fatalError("Couldn't find GameLevels in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("couldn't load GameLevels from main bundle.\n\(error)")
        }
                       
        do {
            let decoder = JSONDecoder()
            levelDetails = try decoder.decode([LevelDetail].self, from: data)
        } catch {
            fatalError("Couldn't parse GameLevels as \([LevelDetail].self)\n\(error)")
        }
    }
}


