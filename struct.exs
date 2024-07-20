defmodule User do
  defstruct name: "Jim", age: 30
end;

defmodule Main do
  def main do
    jim = %User{}
    IO.puts(jim.name)
    IO.puts(jim.age)

    charlotte = %{jim | name: "Charlotte", age: 17};
    IO.puts(charlotte.name)
    IO.puts(charlotte.age)
  end
end

Main.main
