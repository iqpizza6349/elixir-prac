# 익명 함수
sum = fn (a, b) -> a + b end;
IO.puts(sum.(1, 5));

# Capture 익명 함수
sum = &(&1 + &2)
IO.puts(sum.(1, 5));

handle_result = fn
  {var1} -> IO.puts("#{var1} found!")
  {var2, var3} -> IO.puts("#{var2} and #{var3} found!")
end;
handle_result.({"Apple"});
handle_result.({"Hello", "World"});

defmodule Greeter do
  def hello(name, country \\ "en"), do: phrase(country) <> name
  defp phrase("en"), do: "Hello "
  defp phrase("ko"), do: "안녕 "
end

IO.puts(Greeter.hello("World!"));
IO.puts(Greeter.hello("World!", "ko"));

# 재귀
defmodule Power do
  def pow(x, count \\ 5) do
    if count == 0 do
      1
    else
      if rem(count, 2) == 0 do
        pow(x, div(count, 2)) * pow(x, div(count, 2))
      else
        x * pow(x, count - 1)
      end
    end
  end
end

IO.puts(Power.pow(2));

# 또다른 재귀 예제
a = ["Hey", 100, 452, :true, "People"];
defmodule ListPrint do
  def print([]) do
  end

  def print([head | tail]) do
    IO.puts(head)
    print(tail)
  end
end

ListPrint.print(a);

# 원리가 뭔지 잘...
# 첫 번째 print 함수는 빈 목록(종료 조건)일 때 호출됨
# 두 번째 print 함수는 목록을 둘로 나누고 목록의 첫 번째를 head로, 나머지 목록을 tail로 할당함
# 이를 재귀로 무한히 동작시킴.
# 근데 이 예제는 패턴 매칭이랑도 연관이 있어서 이해가 잘 안됨..
