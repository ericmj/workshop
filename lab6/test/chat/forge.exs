defmodule Chat.Forge do
  use Blacksmith

  defmodule ForgedRepo do
    def save(repo, struct) do
      Chat.Repo.save(repo, struct)
    end

    def save_all(repo, list) do
      for(struct <- list, do: save(repo, struct))
    end
  end

  @save_one_function &ForgedRepo.save/2
  @save_all_function &ForgedRepo.save_all/2

  def time_now do
    :calendar.universal_time
    |> :calendar.datetime_to_gregorian_seconds
  end

  register :room,
    __struct__: Chat.Room

  register :user,
    __struct__: Chat.User,
    name: Faker.Name.name,
    created_at: time_now

  register :message,
    __struct__: Chat.Message,
    text: Faker.Lorem.sentence,
    created_at: time_now
end
