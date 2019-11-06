defmodule TableProcessTwo do
  def ping do
    receive do
      :ping -> IO.puts("received ping in #{__MODULE__}")
    end
    ping()
  end

  def start do
    spawn fn -> ping() end# insert spawn here
  end
end
