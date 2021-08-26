//
//  ContentView.swift
//  Cats
//
//  Created by Andreas Zikovic on 2021-08-26.
//

import SwiftUI
import CoreData

struct ImageView: View {
    private let catImageLoader = CatImageLoader()
    
    @State var catUIImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if catUIImage == nil {
                    Text("No cat image has been loaded.")
                } else {
                    CatImageView(uiImage: catUIImage ?? UIImage())
                }
            }.onAppear(perform: checkForCatFacts)
            .navigationTitle("Cat Image")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("New Image") {
                        getCatImage()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Reset") {
                        catUIImage = nil
                    }
                }
            }
        }
    }
    
    func checkForCatFacts() {
        if self.catUIImage == nil {
            getCatImage()
        }
    }
    
    func getCatImage() {
        catUIImage = catImageLoader.loadCatUIImage()
    }
}

struct CatImageView: View {
    var uiImage: UIImage
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .frame(width: 340, height: 380)
    }
}

struct FactsView: View {
    private let catFactsLoader = CatFactsLoader()
    
    @State var catFacts: [CatFact] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if catFacts.isEmpty {
                    Text("No cat fact has been loaded.")
                } else {
                    List (self.catFacts) { (catFact) in
                        HStack {
                            Text(catFact.text ?? "")
                        }
                    }
                }
            }.onAppear(perform: checkForCatFacts)
            .navigationTitle("Cat Facts")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("More Facts", action: getMoreCatFacts)
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Reset") {
                        catFacts.removeAll()
                    }
                }
            }
        }
    }
    
    func checkForCatFacts() {
        if self.catFacts.isEmpty {
            getMoreCatFacts()
        }
    }
    
    func getMoreCatFacts() {
        self.catFactsLoader.loadCatFacts { (result) in
            self.catFacts += result
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        TabView {
            ImageView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Cat Images")
                }
            FactsView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Cat Facts")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
