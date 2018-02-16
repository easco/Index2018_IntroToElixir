defmodule ChatBots.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  def start(_type, _args) do
    import Supervisor.Spec

    # --> Log a message at startup
    Logger.info("Starting the Chat Bots Application!")

    # --> List all child processes to be supervised
    children = [
      worker(ChatBots.Worker, [:bot_a], id: :bot_a),
      worker(ChatBots.Worker, [:bot_b], id: :bot_b)
    ]

    # --> Our strategy is one for one - restart anyone who dies
    opts = [strategy: :one_for_one, name: ChatBots.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
