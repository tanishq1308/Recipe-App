//
//  ContentView.swift
//  Recipe List App
//
//  Created by Tanishq Kakkar on 24/12/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    private var title: String {
        
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return "All Recipes"
        }
        else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Text(title)
                        .bold()
                        .font(Font.custom("Avenir Heavy", size: 24))
                    
                    Spacer()
                    
                    Button(action: {
                        model.selectedCategory = Constants.defaultListFilter
                    }, label: {
                        Image(systemName: "text.justify")
                    })
                    .padding(.horizontal, 10)
                    
                }
                .padding(.top, 40)
                
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach (model.recipes) { r in
                            
                            if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter || model.selectedCategory != nil && r.category == model.selectedCategory {
                                
                                NavigationLink(
                                    destination: RecipeDetailView(recipe: r),
                                    label: {
                                        
                                        // MARK: Row item
                                        HStack(spacing: 20.0) {
                                            Image(r.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipped()
                                                .cornerRadius(5)
                                            
                                            VStack(alignment: .leading) {
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                
                                                RecipeHighlights(highlights: r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    })
                            }
                        }
                    }
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
