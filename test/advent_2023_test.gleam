import gleeunit
import gleeunit/should
import day_1

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
