defmodule TableProcessOne do
  def ping() do
    receive do
      :ping -> {:ok}
    end
  end

  def start do
    spawn fn -> ping() end
  end
end
