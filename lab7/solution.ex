defmodule Lab7Test do
  use ExUnit.Case
  use TrueStory
  import Lab7

  defp full_deck(c) do
    assign c, deck: new_deck()
  end

  defp empty_deck(c) do
    assign c, deck: []
  end

  story "new deck", c
    |> full_deck,
  verify do
    assert length(c.deck) == 52
  end

  story "shuffle deck", c
    |> full_deck,
  verify do
    assert shuffle(c.deck) != shuffle(c.deck)
  end

  story "value of empty deck", c
    |> empty_deck,
  verify do
    assert value_of_deck(c.deck) == 0
  end

  story "value of full deck", c
    |> full_deck,
  verify do
    assert value_of_deck(c.deck) == 364
  end

  story "deal to one player from empty deck", c
    |> empty_deck,
  verify do
    assert deal(c.deck, 1) == {[], []}
  end

  story "deal to no players from deck", c
    |> full_deck,
  verify do
    assert deal(c.deck, 0) == {[], c.deck}
  end

  story "deal to one player from deck", c
    |> full_deck,
  verify do
    {[card], deck} = deal(c.deck, 1)
    assert length(deck) == 51
    refute card in deck
  end
end
