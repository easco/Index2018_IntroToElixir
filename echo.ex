defmodule EchoProcess do

  # --> Receiving messages in a loop
  def echo_message() do
    receive do
      msg -> IO.puts("Echo --> #{inspect(msg)}!")
    end

    # --> recursive call to continue the loop
    echo_message()
  end

end
