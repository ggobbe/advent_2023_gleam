import gleam/io
import gleam/list
import gleam/string
import gleam/option.{Some}
import gleam/int
import gleam/regex.{type Match, Match}
import advent_input.{read}

pub type Set {
  Set(red: Int, blue: Int, green: Int)
}

pub type Game {
  Game(number: Int, sets: List(Set))
}

pub fn main() {
  let input = read("day_2")

  io.println("part 1: " <> part_1(input))
  io.println("part 2: " <> part_2(input))
}

pub fn part_1(input: String) {
  let possible_set = Set(red: 12, green: 13, blue: 14)

  input
  |> string.split("\n")
  |> list.map(parse_game)
  |> list.filter(fn(game) { is_possible_game(game, possible_set) })
  |> list.map(fn(game) { game.number })
  |> int.sum
  |> string.inspect
}

fn is_possible_game(game: Game, reference: Set) -> Bool {
  game.sets
  |> list.all(fn(set) {
    set.red <= reference.red
    && set.blue <= reference.blue
    && set.green <= reference.green
  })
}

pub fn part_2(_input: String) {
  "todo"
}

fn parse_game(line: String) -> Game {
  let assert Ok(re) = regex.from_string("Game (\\d+): (.+)")
  let matches = regex.scan(line, with: re)

  let assert Ok(Match(submatches: submatches, ..)) = list.first(matches)
  let assert [Some(game_number_text), Some(sets_text)] = submatches
  let assert Ok(game_number) = int.parse(game_number_text)

  let sets =
    sets_text
    |> string.split("; ")
    |> list.map(parse_set)

  Game(game_number, sets)
}

fn parse_set(set_text: String) -> Set {
  set_text
  |> string.split(", ")
  |> list.fold(Set(0, 0, 0), fn(acc, color_text) {
    let assert [quantity_text, color] = string.split(color_text, " ")
    let assert Ok(quantity) = int.parse(quantity_text)

    case color {
      "red" -> Set(..acc, red: quantity)
      "blue" -> Set(..acc, blue: quantity)
      "green" -> Set(..acc, green: quantity)
      _ -> panic as "unknown color"
    }
  })
}
