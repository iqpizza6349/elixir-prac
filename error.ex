# 대다수의 언어들은 에러를 핸들링할때, try~catch 문을 사용하지만,
# Elixir 의 경우 try~rescue 문을 사용한다.
err = try do
  raise "oops"
rescue
  e in RuntimeError -> e
end

IO.puts(err.message);

err = try do
  1 + "What?";
rescue
  RuntimeError -> "You've got a runtime error!";
  ArithmeticError -> "You've got a argument error!";
end

IO.puts(err);
# 일반적으로 Elixir 공식 함수들은 2번씩 구현한다.
# 하나는 성공했을 때, 다른 하나는 에러가 발생했을 때.
# 각각 성공했을 때 튜플을 반환한다.

val = try do
  Enum.each 20..100, fn (x) ->
    if rem(x, 13) == 0, do: throw(x);
  end
  "Got Nothing"
catch
  x -> "Got #{x}"
end

IO.puts(val);
# 예외를 던지는 행위 역시 가능하다.
# 이 경우, catch 를 사용하여 잡을 수 있다.

# 프로세스가 죽는 경우, 일반적으로 exit 신호가 발생하게 되는 데, 이 경우 직접 신호를 전달하는 것 역시 가능하다.
# spawn_link(fn -> exit(1) end); 예시
# 이러한 exit 역시 catch 로 잡을 수 있다.
val = try do
  exit "I'm getting out"
catch
  :exit, _ -> "not really"
end

IO.puts(val);

# 어떠한 행위가 모두 끝난 이후 특정 동작을 수행하도록 하는 것 역시 가능하다.
# 이때, After 키워드를 사용하면 된다.
{:ok, file} = File.open("sample.txt", [:utfi8, :write])
try do
  IO.write(file, "blah blah blah");
  raise "oops, something went wrong";
after
  File.close(file);
  IO.puts("close the file...");
end
# try~finally 처럼 사용할 수 있다.
