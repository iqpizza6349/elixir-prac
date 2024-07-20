defmodule Loop do
  def print_multi_times(msg, n) when n <= 1 do
    IO.puts(msg);
  end

  def print_multi_times(msg, n) do
    IO.puts(msg);
    print_multi_times(msg, n - 1);
  end
end

# Elixir 는 전통적인 의미의 loop 가 없고, enum, 재귀, stream 을 사용한 loop 만 존재한다.
Loop.print_multi_times("Hello, World", 10);
