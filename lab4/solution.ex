defmodule Lab4 do
  def print_first_message() do
    spawn(fn ->
      receive do
        message -> IO.puts(message)
      end
    end)
  end

  def print_all_messages() do
    spawn(&print_all_messages_recursive/0)
  end

  defp print_all_messages_recursive() do
    receive do
      message ->
        IO.puts(message)
        print_all_messages_recursive()
    end
  end

  def sum() do
    spawn(fn ->
      receive do
        {:sum, pid, list} -> send(pid, Enum.sum(list))
      end
    end)
  end

  def sum_all(list_of_lists) do
    current_pid = self()

    refs =
      Enum.map(list_of_lists, fn list ->
        ref = make_ref()
        spawn(fn ->
          send(current_pid, {ref, Enum.sum(list)})
        end)
        ref
      end)

    Enum.map(refs, fn ref ->
      receive do
        {^ref, result} -> result
      end
    end)
  end
end
