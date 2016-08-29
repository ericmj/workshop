defmodule Lab45 do
  def start_link do
    spawn_link(fn -> loop(%{}) end)
  end

  def loop(state) do
    receive do
      {:put, key, value} ->
        Map.put(state, key, value)
        |> loop
      {:get, pid, key} ->
        send pid, Map.get(state, key)
        loop(state)
      :clear ->
        loop(%{})
      {:update, key, fun} ->
        Map.update!(state, key, fun)
        |> loop
    end
  end
end
