import UIKit

/// Creates a matrix (minesweeper playfield) where the mines are represented as -1 and where the other numbers represent how many adjecent mines there are.
///
/// - Parameters:
///   - coordinates: The coordines to place the mines (y, x).
///   - numberRows: The number of rows in the minesweeper matrix.
///   - numberOfColums: Then number of colums in the minesweeper matrix.
func mineSweeper(coordinates: [(Int, Int)], numberRows: Int, numberOfColums: Int ) {
    
    var mineSweeperFields = [[Int]]()
    
    for _ in 0..<numberRows {
        mineSweeperFields.append(Array(repeating: 0, count: numberOfColums))
    }
    
    for (y, x) in coordinates {
        mineSweeperFields[y][x] = -1
    }
    
    for (y, x) in coordinates {
        
        //x
        if x+1 <= numberOfColums, mineSweeperFields[y][x+1] != -1 {
            mineSweeperFields[y][x+1] += 1
        }
        
        if x-1 >= 0, mineSweeperFields[y][x-1] != -1 {
            mineSweeperFields[y][x-1] += 1
        }
        
        //y
        if y+1 <= numberRows, mineSweeperFields[y+1][x] != -1 {
            mineSweeperFields[y+1][x] += 1
        }
        
        if y-1 >= 0, mineSweeperFields[y-1][x] != -1 {
            mineSweeperFields[y-1][x] += 1
        }

        //x and y
        if y+1 <= numberRows, x+1 <= numberOfColums, mineSweeperFields[y+1][x+1] != -1 {
            mineSweeperFields[y+1][x+1] += 1
        }
        
        if y-1 >= 0, x+1 <= numberOfColums, mineSweeperFields[y-1][x+1] != -1 {
            mineSweeperFields[y-1][x+1] += 1
        }

        if x-1 >= 0, y+1 <= numberRows, mineSweeperFields[y+1][x-1] != -1 {
            mineSweeperFields[y+1][x-1] += 1
        }

        if y-1 >= 0, x-1 >= 0, mineSweeperFields[y-1][x-1] != -1 {
            mineSweeperFields[y-1][x-1] += 1
        }
    }
    
    for row in mineSweeperFields {
        print(row)
    }
    
}

mineSweeper(coordinates: [(0, 0), (0, 1), (1, 2)], numberRows: 3, numberOfColums: 4)

