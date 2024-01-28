//
//  FileManager-extension.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 19/1/24.
//

import Foundation

extension FileManager {
    
    func write<T: Encodable>(data: T, fileName: String) {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            let encoder = JSONEncoder()
            
            guard let encoded = try? encoder.encode(data) else {
                fatalError("Error encoding data")
            }
            
            do {
                try encoded.write(to: fileURL)
            } catch {
                fatalError("Error writing to file: \(error)")
            }
        }
    }
    
    func read<T: Decodable> (_ file: String) -> T {
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(file)
            
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError("Failed to load \(file)")
            }
            
            let decoder = JSONDecoder()
            
            guard let loaded = try? decoder.decode(T.self, from: data) else {
                fatalError("Failed to decode \(file)")
            }
            return loaded
        } else {
            fatalError("Error loading URL")
        }
    }
}
