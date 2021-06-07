//
//  NewChecklistItemView.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/06/08.
//

import SwiftUI

struct NewChecklistItemView: View {
    var body: some View {
        VStack {
            Text("Add new item")
            Text("Enter item name")
            Button(action: {}) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add new item")
                }   // End of HStack
            }   // End of Button
            Text("Swipe down to cancle")
        }   // End of VStack
    }   // End of body
}   // End of View

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView()
    }
}
