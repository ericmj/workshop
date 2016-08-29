defmodule Lab4 do
  def task1(message) do
    spawn fn ->
      receive do
        string -> IO.puts string
      end
    end

    send pid, message
  end

  def task2() do
    pid = spawn fn ->
      receive do
        {:sum, pid, list} -> send pid, Enum.sum(list)
      end
    end
  end

  def task3(list_of_lists) do
    current_pid = self

    refs =
      Enum.map(list_of_lists, fn list ->
        ref = make_ref()
        spawn fn ->
          send current_pid, {ref, Enum.sum(list)}
        end
        ref
      end)

    Enum.map(refs, fn ref ->
      receive do
        {^ref, result} -> result
      end
    end)
  end

  defmodule Advanced do
    def task1(list) do
      task = Task.async(fn ->
        Enum.sum(list)
      end

      Task.await(task)
    end

    def task2(list_of_lists) do
      tasks =
        Enum.map(list_of_lists, fn list ->
          Task.async(fn ->
            Enum.sum(list)
          end
        end)

      Enum.map(tasks, fn task ->
        Task.await(task)
      end)
    end
  end
end
