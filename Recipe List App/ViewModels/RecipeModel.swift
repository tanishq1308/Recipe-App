//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Tanishq Kakkar on 24/12/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
    }
}
