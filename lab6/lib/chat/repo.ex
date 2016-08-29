defmodule Chat.Repo do
  def start_link do
    Agent.start_link(fn -> %{__counter__: 0} end)
  end

  def save(pid, model) do
    table = model.__struct__

    Agent.get_and_update(pid, fn %{__counter__: counter} = repo ->
      unless model.id do
        model = %{model | id: counter}
        counter = counter + 1
      end

      default = Map.put(%{}, counter, model)
      repo = Map.update(repo, table, default, &Map.put(&1, counter, model))
      {model, %{repo | __counter__: counter}}
    end)
  end

  def delete(pid, model) do
    table = model.__struct__

    Agent.update(pid, fn repo ->
      Map.update(repo, table, %{}, &Map.delete(&1, model.id))
    end)
  end

  def get(pid, table, id) do
    Agent.get(pid, fn repo ->
      repo[table][id]
    end)
  end

  def all(pid, table, ids \\ nil) do
    Agent.get(pid, fn repo ->
      map = repo[table] || %{}

      if ids do
        Map.take(map, ids)
      else
        Map.values(map)
      end
    end)
  end
end
