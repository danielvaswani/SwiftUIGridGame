//
//  ContentView.swift
//  SwiftUIGridGame
//
//  Created by Daniel Vaswani on 05/08/2021.
//

import SwiftUI

struct ContentView: View {
//    @State private var grid = getGrid(rows: 4, columns: 4)
//    let spacingAmount : CGFloat = 60
    
    var body: some View {
        VStack(spacing:30){
            Text("Up and down movement")
            GridUpDownView(rows: 4, columns: 4)
            Text("Left and right movement")
            GridLeftRightView(rows: 4, columns: 4)
        }
    }
}

//struct GridCell : Identifiable {
//    var id = UUID()
//    var number : Int
//    var x: Int
//    var y: Int
//}

//func getGrid(rows : Int, columns : Int) -> [GridCell] {
//    var grid = [GridCell]()
//    var counter = 1
//    for row in 1...rows {
//        print("row \(row)")
//        for col in 1...columns{
//            print("column \(col)")
//            grid.append(GridCell(number : counter, x : row, y: col))
//            counter += 1
//        }
//    }
//    return grid
//}

//struct GridCellView : View {
//    var grid : [GridCell]
//
//    var body : some View {
//        Text("Hello world")
//    }
//}

struct GridUpDownView : View {
    var rows, columns : Int
    //@State private var isTrailing = false
    @State private var isTop = false
    
    var total : Int {
        rows * columns
    }
    
    var body: some View {
        //VStack(alignment: (isTrailing ? .trailing : .leading), spacing:0){
        HStack(alignment: (isTop ? .top : .bottom), spacing:0){
            ForEach(0 ..< rows){ row in
                //HStack(spacing:0){
                VStack(alignment: .leading, spacing:0){
                    ForEach(1 ..< columns+1){ column in
                        if column + columns * row != total {
                            Text("\(column+(columns*row))")
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .border(Color.black,width:0.5)
                        }
                        
                    }
                }
            }
            
        }
        .border(Color.black,width:1)
        .onTapGesture {
            //self.isTrailing.toggle()
            self.isTop.toggle()
        }
    }
}
struct GridLeftRightView : View {
    var rows, columns : Int
    @State private var isTrailing = false
    
    
    var total : Int {
        rows * columns
    }
    
    var body: some View {
        VStack(alignment: (isTrailing ? .trailing : .leading), spacing:0){
            ForEach(0 ..< rows){ row in
                HStack(spacing:0){
                    
                    ForEach(1 ..< columns+1){ column in
                        if column + columns * row != total {
                            Text("\(column+(columns*row))")
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .border(Color.black,width:0.5)
                        }
                        
                    }
                }
            }
            
        }
        .border(Color.black,width:1)
        .onTapGesture {
            //self.isTrailing.toggle()
            self.isTrailing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
