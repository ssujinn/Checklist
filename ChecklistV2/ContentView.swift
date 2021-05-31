//
//  ContentView.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) {
                    item in Text(item)  }
            } // End of list
            .navigationBarTitle("Checklist")
            .onAppear() {
                self.printChecklistContents()
            }
        } // End of navigationView
    } // End of body

    // Method
    func printChecklistContents(){
        for item in checklistItems {
            print(item)
        }
    }
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
