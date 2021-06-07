//
//  RowView.swift
//  ChecklistV2
//
//  Created by RelMac User Exercise2 on 2021/06/08.
//

import SwiftUI

struct RowView: View {
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)){
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "☑️" : "⬛️")
            }   // End of HStack
        }   // End of NaviationLink
    }   // End of View
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "sample item")))
    }
}
