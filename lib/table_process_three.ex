defmodule TableProcessThree do
  def ping do
    receive do
      {caller, :ping} -> send(caller, {self(), :pong})
    end

    ping()
  end

  def pong do
    receive do
      {caller, :pong} -> send(caller, {self(), :ping})
    end
    pong()
  end

  def start do
    # spawn two processes and return both process ids
    {spawn(__MODULE__, :ping, []), spawn(__MODULE__, :pong, [])}
  end
end
