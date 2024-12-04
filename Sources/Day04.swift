import Algorithms

struct Day04: AdventDay {
  var data: String

  // example input
  // MMMSXXMASM
  // MSAMXMSMSA
  // AMXSXMAAMM
  // MSAMASMSMX
  // XMASAMXAMM
  // XXAMMXXAMA
  // SMSMSASXSS
  // SAXAMASAAA
  // MAMMMXMMMM
  // MXMXAXMASX
  var input: [String] {
    data
      .split(separator: "\n")
      .map { String($0) }
  }

  // 2644
  func part1() -> Any {
    let target = "XMAS"
    let grid = input.map { Array($0) }
    let rows = grid.count
    let cols = grid[0].count
    let directions = [(-1,-1), (-1,0), (-1,1), (0,-1), (0,1), (1,-1), (1,0), (1,1)]

    func dfs(_ row: Int, _ col: Int, _ index: Int, _ dir: (Int, Int)) -> Int {
      if index == target.count { return 1 }
      if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] != Array(target)[index] { return 0 }
      return dfs(row + dir.0, col + dir.1, index + 1, dir)
    }
    
    var sum = 0
    for row in 0..<rows {
      for col in 0..<cols {
        for dir in directions {
          sum += dfs(row, col, 0, dir)
        }
      }
    }
    return sum
  }

  func part2() -> Any {
    var sum = 0
    return sum
  }
}
