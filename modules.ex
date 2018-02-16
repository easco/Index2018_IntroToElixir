# --> defining a new module
defmodule KitchenTools do
  # --> documentation for the module
  @moduledoc """
  This is a multiline module documentation string
  With an extra line just to point out that it's multiline
  """

  # --> simple function definition
  def product_categories do
    ["Bowls", "Spoons", "Knives", "Towels"]
  end

  #
  # --> A function with multiple heads
  #

  # --> documentation for the function
  @doc "print a list of products"
  def print_products([]), do: :ok

  def print_products([head | tail]) do
    IO.puts(head)

    # --> Recursion to get looping behavior
    print_products(tail)
  end
end
