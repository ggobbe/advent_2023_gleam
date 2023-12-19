import gleam/io
import gleam/list
import gleam/string
import gleam/int
import gleam/regex.{type Match, Match}
import advent_input.{read}

const substitutions = [
  #("one", "o1e"),
  #("two", "t2o"),
  #("three", "t3e"),
  #("four", "f4r"),
  #("five", "f5e"),
  #("six", "s6x"),
  #("seven", "s7n"),
  #("eight", "e8t"),
  #("nine", "n9e"),
]

pub fn main() {
  let input = read("day_1")

  io.println("part 1: " <> part_1(input))
  io.println("part 2: " <> part_2(input))
}

pub fn part_1(input: String) {
  input
  |> string.split("\n")
  |> list.map(extract_number)
  |> int.sum
  |> string.inspect
}

pub fn part_2(input: String) {
  list.fold(over: substitutions, from: input, with: fn(acc, sub) {
    let #(from, to) = sub
    string.replace(in: acc, each: from, with: to)
  })
  |> part_1
}

fn extract_number(line: String) {
  let assert Ok(re) = regex.from_string("[1-9]")
  let matches = regex.scan(line, with: re)

  let assert Ok(Match(content: first, ..)) = list.first(matches)
  let assert Ok(Match(content: last, ..)) = list.last(matches)
  let assert Ok(number) = int.parse(first <> last)

  number
}
