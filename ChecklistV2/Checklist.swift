//
//  Checklist.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/06/07.
//

import Foundation

class Checklist: ObservableObject {
    
    //Initialization
    init() {
        loadChecklistItems()
    }
    /*@Published var items = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true)
    ]*/
    
    @Published var items: [ChecklistItem] = []
    
    // Method
    func printChecklistContents(){
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        items.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
    // Data persistence
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Checklist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
    
    // Saving the file
    func saveChecklistItems() {
        print("Saving checklist items")
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            print("Checklist items saved")
        }
        catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }   // End of try
    }   // End of function
    
    // Load the file
    func loadChecklistItems(){
        print("Loading checklist items")
        
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
                print("Checklist items loaded")
            }
            catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }   // End of catch
        }   // End of if
    }   // End of function
}
