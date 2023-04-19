//
//  AppDelegate.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-03-16.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var volume : Int = 100
    let scoreImages: [String] = ["gold", "silver", "bronze"]
    let dbName = "scores.db"
    var dbPath = ""
    
    var scores : [Score] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let docFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            self.dbPath = docFolder.path + "/" + dbName
            createDbIfRequired()
            
        }
        
        volume = 100
        return true
    }
    
    // This method creates the database if it doesn't already exist
    func createDbIfRequired(){
        let fileIsFound = FileManager.default.fileExists(atPath: dbPath)
        if fileIsFound{
            return
        }
        
        let dbSource = Bundle.main.resourcePath! + "/" + dbName
        try? FileManager.default.copyItem(atPath: dbSource, toPath: dbPath)
    }

    // This method inserts a score into the database
    func insertIntoDatabase(userScore: Score){
        
        var db: OpaquePointer?
        
        // Open the database and prepare the statement for insertion
        if sqlite3_open(dbPath, &db) == SQLITE_OK{
            
            var query: OpaquePointer?
            let statement = "insert into scores values(NULL, ?, ?)"
            
            if sqlite3_prepare_v2(db, statement, -1, &query, nil) == SQLITE_OK{
                
                // Bind the score and the current date to the statement
                let score = userScore.score
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let date = dateFormatter.string(from: Date()) as NSString
                
                sqlite3_bind_int(query, 1, Int32(score))
                sqlite3_bind_text(query, 2, date.utf8String, -1, nil)
                
                // Execute the statement and finalize it
                if sqlite3_step(query) == SQLITE_DONE{
                    
                }
                sqlite3_finalize(query)
            }
            else{
                print("error")
            }
            sqlite3_close(db)
        }
    }

    // This method reads scores from the database
    func readDb(){
        self.scores = []
        
        var db: OpaquePointer?
        
        // Open the database and prepare the query
        if sqlite3_open(dbPath, &db) == SQLITE_OK{
            
            var query: OpaquePointer?
            let queryString = "select * from scores"
            
            if sqlite3_prepare_v2(db, queryString, -1, &query, nil) == SQLITE_OK{
                
                // Loop through the results and append each score to the scores array
                while sqlite3_step(query) == SQLITE_ROW{
                    let id = sqlite3_column_int(query, 0)
                    let score_column = sqlite3_column_int(query, 1)
                    let userScore =



                    Score(score: Int(score_column))

                    scores.append(userScore)
                    print(scores.count)
                
                }
                sqlite3_finalize(query)
                print("inserted")
                print(self.scores.count)
                print("hui")
            }
            else{
                print("error")
                
            }
            sqlite3_close(db)
        }
        
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

