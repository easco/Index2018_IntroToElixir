defmodule ChatBots.Worker do
  # --> our worker is a GenServer
  use GenServer

  # --> We're going to use the Logger application
  require Logger

  def start_link(name) do
    # --> start the server and register it with the name passed in
    GenServer.start_link(__MODULE__, [name], name: name)
  end

  def init([name]) do
    # --> Log when a new worker is starting up
    Logger.info("Starting up #{name}:#{inspect(self())}")
    {:ok, %{name: name}}
  end

  # --> API

  def respond_to(worker, message) do
    GenServer.call(worker, {:respond_to, message})
  end

  def die(worker, reason) do
    GenServer.cast(worker, {:die, reason})
  end

  # Genserver message handling

  # --> Note the odd pattern matching construct in the last parameter
  def handle_call({:respond_to, message}, _sender, %{name: name} = state) do
    Logger.info("Worker #{name}:#{inspect(self())} responding to #{message}")
    {:reply, :ok, state}
  end

  def handle_cast({:die, reason}, %{name: name} = state) do
    Logger.error("Oh no!  Something's gone terriby wrong with #{name}!")
    raise(RuntimeError, reason)

    {:noreply, state}
  end
end
