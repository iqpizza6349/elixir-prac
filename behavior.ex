defmodule GreetBehaviour do
  @callback say_hello(name :: String.t()) :: nil
  @callback say_bye(name :: String.t()) :: nil
end

defmodule EnglishGreet do
  @behaviour GreetBehaviour
  def say_hello(name), do: IO.puts("Hello " <> name)
  def say_bye(name), do: IO.puts("Goodbye, " <> name)
end

defmodule SpanishGreet do
  @behaviour GreetBehaviour
  def say_hello(name), do: IO.puts("Hola " <> name)
  def say_bye(name), do: IO.puts("Adios " <> name)
end

EnglishGreet.say_hello("Ayush")
EnglishGreet.say_bye("Ayush")
SpanishGreet.say_hello("Ayush")
SpanishGreet.say_bye("Ayush")
