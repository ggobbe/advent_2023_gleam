import gleam/string
import simplifile

pub fn read(day: String) -> String {
  let input_file = "input/" <> day <> ".txt"

  case simplifile.read(input_file) {
    Ok(input) ->
      input
      |> string.trim
    Error(_) -> panic as "Cannot read input file"
  }
}
