defmodule Workshop do
  def subl(filename) do
    System.cmd("subl", [filename])
  end

  def open(filename), do: System.cmd("open", [filename])

  def start_section(name) do
    IO.puts([
      IO.ANSI.clear(),
      IO.ANSI.home(),
      "------ ",
      IO.ANSI.bright(),
      name,
      IO.ANSI.reset(),
      " ------",
      "\n"
    ])
  end
end
