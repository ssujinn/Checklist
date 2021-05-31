//
//  ContentView.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Walk the dog")
                Text("Brush my teeth")
                Text("Learn iOS development")
                Text("Soccer practice")
                Text("Eat Ice cream")
            } // End of body
            .navigationBarTitle("Checklist")
        } // End of navigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
