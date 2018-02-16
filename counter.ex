defmodule Counter do

  # --> Utility function for spawing new counters for us
  def make_counter(initial_value \\ 20) do
    # --> spawn uses Module, Function, Arguments (MFA) style
    # --> note the use of the __MODULE__ macro
    spawn(__MODULE__, :counter, [initial_value])
  end

  # --> Recursive message loop with state
  def counter(start) do
    receive do
      # --> Handle an add message
      {:add, n} ->
        IO.puts("Value is #{start + n}")
        # --> and recursively call with new state
        counter(start + n)
      
      # --> Handle the subtract message
      {:subtract, n} ->
        IO.puts("Value is #{start - n}")
        counter(start - n)

      # --> Show doesn't change the state
      :show ->
        IO.puts("Value is #{start}")
        counter(start)

      # --> This message stops the process with the given reason
      {:die, reason} ->
        exit(reason)
    end
  end

end
