defmodule Counter2 do
  use GenServer

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, [initial_value])
  end

  def init([initial_value]) do
    {:ok, initial_value}
  end

  #
  # --> We provide a series of functions that 
  # form a convenient API for working with counters.
  # Under the hood, they're just messages
  #
  def get(counter) do
    GenServer.call(counter, :get)
  end

  def add(counter, number) when is_integer(number) do
    GenServer.call(counter, {:add, number})
  end

  def subtract(counter, number) when is_integer(number) do
    GenServer.call(counter, {:subtract, number})
  end

  def show(counter) do
    GenServer.cast(counter, :show)
  end

  def stop(counter) do
    GenServer.cast(counter, :stop)
  end

  # ----- Message Handling -----
  def handle_call(:get, _sender, state) do
    {:reply, state}
  end

  def handle_call({:add, n}, _sender, state) do
    {:reply, state + n, state + n}
  end

  def handle_call({:subtract, n}, _sender, state) do
    {:reply, state - n, state - n}
  end

  # Asynchronous Message Handling
  def handle_cast(:show, state) do
    IO.puts("The value is #{state}")
    {:noreply, state}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end
end
