defmodule FunnyCalculator do
  @type number_with_joke :: {number, String.t}

  @spec add(number, number) :: number_with_joke
  def add(x, y), do: {x + y, "You need a calculator to do that?"}

  @spec multiply(number, number) :: number_with_joke
  def multiply(x, y), do: {x * y, "It is like addition on steroids."}
end

{result, comment} = FunnyCalculator.add(10, 20)
IO.puts(result)
IO.puts(comment)
