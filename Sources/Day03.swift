import Algorithms

struct Day03: AdventDay {
  var data: String

  // example input
  // part 1: xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
  // part 2: xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
  var input: [String] {
    data
      .split(separator: "\n")
      .map { String($0) }
      .flatMap { line in
        line
          .matches(of: /mul\((\d+),(\d+)\)|don't\(\)|do\(\)/)
          .map { match in "\(match.0)" }
      }
  }

  // 196826776
  func part1() -> Any {
    var sum = 0
    for instruction in input {
      instruction.matches(of: /mul\((\d+),(\d+)\)/).forEach { match in
        if let x = Int(match.1), let y = Int(match.2) {
          sum += x * y
        }
      }
    }
    return sum
  }

  // 106780429
  func part2() -> Any {
    var sum = 0
    var shouldSkip = false
    for instruction in input {
      if instruction == "don't()" {
        shouldSkip = true
        continue
      }
      if instruction == "do()" {
        shouldSkip = false
        continue
      }
      if !shouldSkip {
        instruction.matches(of: /mul\((\d+),(\d+)\)/).forEach { match in
          if let x = Int(match.1), let y = Int(match.2) {
            sum += x * y
          }
        }
      }
    }
    return sum
  }
}
