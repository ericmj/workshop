defmodule Chat do
  def time_now do
    :calendar.universal_time
    |> :calendar.datetime_to_gregorian_seconds
  end
end
