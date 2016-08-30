defmodule Lab45Tests do
  use ExUnit.Case
  import Lab45

  test "new cache" do
    pid = start_link()
    assert is_pid(pid)
  end

  test "put and get value" do
    pid = start_link()
    put(pid, :key, :apple)
    assert get(pid, :key) == :apple

    put(pid, :key, :ibm)
    assert get(pid, :key) == :ibm

    refute get(pid, :company)
  end

  test "put and get value with multiple processes" do
    pid1 = start_link()
    pid2 = start_link()

    put(pid1, :key, 1)
    put(pid2, :key, 2)

    assert get(pid1, :key) == 1
    assert get(pid2, :key) == 2
  end

  test "clear cache" do
    pid = start_link()

    put(pid, :key, :value)
    assert get(pid, :key) == :value

    clear(pid)
    refute get(pid, :key)
  end

  test "update cache" do
    pid = start_link()

    put(pid, :key, 2)
    assert get(pid, :key) == 2

    update(pid, &(&1 + 2))
    assert get(pid, :key) == 4
  end
end
