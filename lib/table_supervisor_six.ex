defmodule TableSupervisorSix do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{
        id: :six021M,
        start: {TableServerSix, :start_link, [0, :six021M]}
      }
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
