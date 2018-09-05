defmodule TableProcessOne do
  def ping() do
    receive do
      :ping -> IO.puts("received ping in #{__MODULE__}")
    end
  end

  def start do
    spawn fn -> ping() end
  end
end
