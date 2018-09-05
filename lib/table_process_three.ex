defmodule TableProcessThree do
  defp answer_pong(to) do
    pong_message = {self(), :pong}
    send(to, pong_message)
  end

  def answer_ping(to) do
    ping_message = {self(), :ping}
    send(to, ping_message), :ping})
  end

  def ping do
    receive do
      {caller, :ping} -> answer_pong(caller)
    end

    ping()
  end

  def pong do
    receive do
      {caller, :pong} -> answer_ping(caller)
    end
    pong()
  end

  def start do
    # spawn two processes and return both process ids
    {spawn(__MODULE__, :ping, []), spawn(__MODULE__, :pong, [])}
  end
end
