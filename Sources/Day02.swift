import Algorithms

struct Day02: AdventDay {
  var data: String

  // example input
  // 42 44 47 49 51 52 54 52
  // 24 27 30 31 32 35 36 36
  // 80 82 85 86 87 90 94
  // ...
  var input: [[Int]] {
    data.split(separator: "\n").compactMap {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // 282
  func part1() -> Any {
    var sum = 0
    for row in input {
      guard isValid(row) else {
        continue
      }
      sum += 1
    }
    return sum
  }

  // 349
  func part2() -> Any {
    var sum = 0
    for row in input {
      guard isValid(row) || isValid2(row) else {
        continue
      }
      sum += 1
    }
    return sum
  }

  func isValid(_ row: [Int]) -> Bool {
    let diff = zip(row, row.dropFirst()).map { $1 - $0 }
    return diff.allSatisfy { abs($0) >= 1 && abs($0) <= 3 } && (diff.allSatisfy { $0 > 0 } || diff.allSatisfy { $0 < 0 })
  }

  func isValid2(_ row: [Int]) -> Bool {
    for i in 0..<row.count {
      var row = row
      row.remove(at: i)
      if isValid(row) {
        return true
      }
    }
    return false
  }
}
