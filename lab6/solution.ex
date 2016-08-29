defmodule Chat.RoomTest do
  use ExUnit.Case
  use ShouldI
  require Chat.Forge
  alias Chat.Forge
  alias Chat.Room
  alias Chat.Message

  with "empty room" do
    setup context do
      {:ok, repo} = Chat.Repo.start_link

      assign context,
        repo: repo,
        room: Forge.saved_room(repo)
    end

    should "have no members", context do
      assert Room.members(context.repo, context.room) == []
    end

    with "two members jane and bob" do
      setup context do
        jane = Forge.saved_user(context.repo)
        jane = Room.join(context.repo, context.room, jane)
        bob = Forge.saved_user(context.repo)
        bob = Room.join(context.repo, context.room, bob)

        assign context,
          jane: jane,
          bob: bob
      end

      should "have joined members", context do
        assert context.jane.room_id == context.room.id

        assert context.jane in Room.members(context.repo, context.room)
        assert context.bob in Room.members(context.repo, context.room)
      end

      with "messages in room" do
        setup context do
          context =
            Forge.having room_id: context.room.id do
              assign context,
                bob_msg_1:  Forge.saved_message(context.repo, user_id: context.bob.id),
                jane_msg_1: Forge.saved_message(context.repo, user_id: context.jane.id),
                jane_msg_2: Forge.saved_message(context.repo, user_id: context.jane.id)
            end

          assign context,
            bob_msg_2: Forge.saved_message(context.repo, user_id: context.bob.id)
        end

        should "have messages in room", context do
          assert context.bob_msg_1.text in Message.messages_in_room(context.repo, context.room)
          assert context.jane_msg_1.text in Message.messages_in_room(context.repo, context.room)
        end
      end
    end
  end
end
