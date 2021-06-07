//
//  ContentView.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/05/31.
//

import SwiftUI

struct ChecklistView: View {
    //@State var checklist.checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) {
                    checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        //print(" The user tapped a list view \(checklistItem.name).")
                        if let matchingIndex = self.checklist.items.firstIndex(where:
                            {$0.id == checklistItem.id}) {
                            self.checklist.items[matchingIndex].isChecked.toggle()}
                            self.checklist.printChecklistContents()
                    }
                } // End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            } // End of list
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible=true}){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear() {
                self.checklist.printChecklistContents()
            }
        } // End of navigationView
    } // End of body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
