defmodule Counter do
  # --> Mix in elements the GenServer module needs
  use GenServer

  # --> Define a start_link function for our GenServer
  def start_link(initial_value) do
    # ---> Pass the call on to the generic GenServer start_link function
    GenServer.start_link(__MODULE__, [initial_value])
  end

  # --> Establish the initial state
  def init([initial_value]) do
    {:ok, initial_value}
  end

  #
  # --> Synchronous Message Handling with calls
  #

  def handle_call(:get, _sender, state) do
    # --> reply, the reply value, and the new state
    {:reply, state, state}
  end

  def handle_call({:add, n}, _sender, state) do
    {:reply, state + n, state + n}
  end

  def handle_call({:subtract, n}, _sender, state) do
    {:reply, state - n, state - n}
  end

  #
  # --> Asynchronous Message Handling with cast
  #

  def handle_cast(:show, state) do
    IO.puts("The value is #{state}")
    {:noreply, state}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  # --> also handle_info
  # --> terminate
  # --> code update
end
