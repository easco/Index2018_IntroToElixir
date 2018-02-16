defmodule ChatBotsTest do
  use ExUnit.Case
  doctest ChatBots

  test "greets the world" do
    assert ChatBots.hello() == :world
  end
end
