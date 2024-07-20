defmodule Loop do
  def print_multi_times(msg, n) when n <= 1 do
    IO.puts(msg);
  end

  def print_multi_times(msg, n) do
    IO.puts(msg);
    print_multi_times(msg, n - 1);
  end
end

Loop.print_multi_times("Hello, World", 10);
