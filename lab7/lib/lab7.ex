defmodule Lab7 do
  @suits [:hearts, :clubs, :diamonds, :spades]
  @values 1..13

  def new_deck do
    for suit <- @suits,
        value <- @values,
        do: {suit, value}
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def value_of_deck(deck) do
    Enum.reduce(deck, 0, fn {_suit, value}, sum ->
      sum + value
    end)
  end

  def deal(deck, 0) do
    empty_deck = []
    {empty_deck, deck}
  end

  def deal([], _num) do
    empty_deck = []
    {empty_deck, empty_deck}
  end

  def deal(deck, num) do
    card = Enum.random(deck)
    deck = List.delete(deck, card)
    {cards, deck} = deal(deck, num-1)
    {[card|cards], deck}
  end
end
