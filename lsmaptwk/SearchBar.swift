//
//  SearchBar.swift
//  lsmaptwk
//
//  Created by Isaiah Thomas on 2/24/20.
//  Copyright © 2020 zaycation. All rights reserved.
//

import SwiftUI

import SwiftUI

struct SearchBar: View {
    
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

    var body: some View {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).frame(width: 200.0).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").frame(width: 50.0).opacity(searchText == "" ? 0 : 1)
                        }
                        }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.darkGray))
                    .opacity(0.2)
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
                }
                .resignKeyboardOnDragGesture()
            }
        }
    




struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           SearchBar()
              .environment(\.colorScheme, .light)

        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
