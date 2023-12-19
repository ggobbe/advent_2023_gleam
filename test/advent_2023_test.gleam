import gleeunit
import gleeunit/should
import day_1
import day_2

pub fn main() {
  gleeunit.main()
}

pub fn day_1_test() {
  day_1.part_1(
    "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet",
  )
  |> should.equal("142")

  day_1.part_2(
    "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen",
  )
  |> should.equal("281")
}

pub fn day_2_test() {
  day_2.part_1(
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green",
  )
  |> should.equal("8")
}
