import Algorithms

struct Day01: AdventDay {
  var data: String

  struct Row {
    let left: Int
    let right: Int
    var diff: Int {
      abs(left - right)
    }
  }

  // example input
  // 15244   50562
  // 81245   49036
  // ...
  var entities: ([Int], [Int]) {
    var left = [Int]()
    var right = [Int]()

    data.split(separator: "\n").forEach {
      let values = $0.split(separator: " ")
      if let l = Int(values[0]), let r = Int(values[1]) {
        left.append(l)
        right.append(r)
      }
    }
    return (left, right)
  }

  // 1660292
  func part1() -> Any {
    let (left, right) = entities
    let rows = zip(left.sorted(), right.sorted()).map(Row.init)
    return rows.map(\.diff).reduce(0, +)
  }

  // 22776016
  func part2() -> Any {
    let (left, right) = entities
    return left.map { l in
      l * right.filter { $0 == l }.count
    }.reduce(0, +)
  }
}
