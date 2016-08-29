defmodule Chat.User do
  defstruct [:id, :room_id, :name, :created_at]

  def new(username) do
    %Chat.User{name: username, created_at: Chat.time_now}
  end
end
