defmodule TableServerTwo do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  @impl true
  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  @impl true
  def init(args) do
    {:ok, args}
  end

  @impl true
  def ping() do
    {:ok}
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  @impl true
  def handle_call(:ping, _from, []) do
    {:reply, {:ok}, []}
  end
end
