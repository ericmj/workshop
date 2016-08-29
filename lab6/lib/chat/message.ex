defmodule Chat.Message do
  defstruct [:id, :room_id, :user_id, :text, :created_at]
  alias Chat.Repo
  alias Chat.Message

  def new(room, user, text) do
    %Chat.Message{room_id: room.id, user_id: user.id, text: text,
                  created_at: Chat.time_now}
  end

  def messages_in_room(repo, room) do
    messages = Repo.all(repo, Message)

    for %Message{room_id: room_id, text: text} <- messages,
        room_id == room.id,
        do: text
  end
end
