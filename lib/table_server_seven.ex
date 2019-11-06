defmodule TableServerSeven do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link([start, final], server_name) do
    GenServer.start_link(__MODULE__, [start, final], name: global_server_name(server_name))
  end

  def init([start, final]) do
    # Need to handle both a start_number and an end_number
    {:ok, [start, final]}
  end

  def stop(server_name) do
    GenServer.stop(global_server_name(server_name))
  end

  def ping(server_name) do
    try_call(server_name, :ping)
  end

  def pong(server_name) do
    try_call(server_name, :pong)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, state) do
    [current, final] = state
    final_reached = final - current
    case final_reached do
      0 ->
        new_state = [current, final]
        {:reply, {:ok, current}, new_state}
      _ ->
        new_state = [current + 1, final]
        {:reply, {:ok, current}, new_state}
    end
  end

  def handle_call(:pong, _from, state) do
    [current, final] = state
    final_reached = final - current
    case final_reached do
      0 ->
        new_state = [current, final]
        {:reply, {:ok, current}, new_state}
      _ ->
        new_state = [current + 1, final]
        {:reply, {:ok, current}, new_state}
    end
  end

  defp global_server_name(server_name) do
    {:global, {:servername, server_name}}
  end

  defp try_call(server_name, message) do
    case GenServer.whereis(global_server_name(server_name)) do
      nil ->
        {:error, :invalid_server}

      servername ->
        GenServer.call(servername, message)
    end
  end
end
