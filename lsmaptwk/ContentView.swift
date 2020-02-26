//
//  ContentView.swift
//  lsmaaptwk
//
//  Created by Isaiah Thomas on 02/24/2020
//  Copyright © 2020 zaycation. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    

    @State var isOpen = false
    var body: some View {

        ZStack{
            Text("   ")
                 .frame(minWidth: CGFloat(0), maxWidth: .infinity, minHeight: CGFloat(0), maxHeight: .infinity).background(Color(.gray))
                   .edgesIgnoringSafeArea(.all)
            MapView()
                .frame(width: 400, height: 350, alignment: .center).cornerRadius(35)
            VStack  {
                HStack  {
                Button(action: {
                    
                    
                }) {
                    Image(systemName: "mappin").foregroundColor(Color(.blue)).padding().background(Color(.darkGray)).opacity(0.2).clipShape(Circle()).font(.caption).padding()
                                    }
                SearchBar()
                    Spacer()
                    
                    }
                }.padding(.bottom, 280.0)
            
            
            
            VStack  {
                HStack  {
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.secondary)
                        .frame(width: 60, height: 6).onTapGesture {
                        self.isOpen.toggle()
                    }
                    /*
                Button(action: {}) {
                    Image(systemName: "arrowtriangle.down").foregroundColor(Color(.blue)).padding().background(Color(.darkGray)).opacity(0.2).clipShape(Circle()).font(.callout).padding()
                                    }
            */
                    Spacer()
                    }
                }.padding(.top, 280.0)
            
            
            
            
            
            
            }
        }
    }

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
