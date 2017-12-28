defmodule TableServerZeroTest do
  use ExUnit.Case

  test "receive pong from ping" do
    {ping_pid, pong_pid} = TableServerZero.start()

    send(ping_pid, {self(), :ping})
    assert_receive({ping_spid, :pong}, 1500)
    refute ping_pid == self()

    send(pong_pid, {self(), :pong})
    assert_receive({pong_spid, :ping}, 1500)
    refute pong_pid == self()
  end
end
