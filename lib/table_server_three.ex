defmodule TableServerThree do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # ----------------------------------------- #
  def start_link(value) do
    GenServer.start_link(__MODULE__, value, name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  def pong() do
    GenServer.call(__MODULE__, :pong)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end

  def handle_call(:pong, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end
end
