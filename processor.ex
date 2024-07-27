# process 는 Elixir 에서 독립적으로 동작하고 동시에 동작하면서 메시지를 서로 상호간 전달할 수 있습니다.
# Thread 와 동일하거나 혹은 다른 개념일 수도?
# 모든 Elixir 코드들은 Process 에서 동작한다.

# spawn 함수를 사용해서 가장 쉽게 process 를 생성할 수 있다.
pid = spawn(fn -> 2 * 2 end);
IO.puts("Waiting...");
IO.puts(Process.alive?(pid));

# 이때, 위 코드를 수행하면, false 가 반환되는 데,
# 그 이유는 spawn 함수는 실행한 프로세스의 PID 를 반환하는 데,
# 함수가 실행됨과 동시에 프로세스가 종료되기 때문에 Process#alive 를 했을 때,
# 해당 프로세스가 이미 종료되었기 때문에 false 가 반환된다.

# 현재 동작하고 있는 메인 프로세스의 PID 혹은 프로세스를 확인하고 싶다면,
# self 를 통해 참조하면 된다.
pid = self()
IO.puts(Process.alive?(pid));

# Message 를 전달하는 방법은 send 함수를 사용하며, receive 를 통해 메시지를 들을 수 있다.
send(self(), {:hello, "Hi people"})

receive do
   {:hello, msg} -> IO.puts(msg)
   {:another_case, msg} -> IO.puts("This one won't match! #{msg}!")
end

# 메시지를 송신하면, 곧바로 메시지가 receive 로 가는 것이 아닌 일종의 메시지 사서함으로 이동한 이후,
# receive 를 통해 전달되며, 해당 receive 가 패턴을 통해 메시지가 매칭되어야만, 동작을 한다고 한다.

# receive 에서 아무런 패턴을 찾지못했다면, 해당 패턴의 메시지가 올때까지 기다리게 되는 데,
# 이때 timeout 역시 설정할 수 있다.
receive do
  {:hello, msg}  -> IO.puts(msg)
after
  1_000 -> IO.puts("nothing after 1s")
end

# timeout 을 0으로 설정할 수 있다. 이 경우 이미 메시지가 사서함에 있을 경우에만 전달이 될 것이다.
# 그리고 위 코드들로 하여금 알 수 있듯이 한 번 receive 된 메시지는 다시 전달되지 않는다.

# 가장 보편적인 프로세스를 생성하는 방법은 spawn_link 를 사용하는 방법이다.
# 일반적으로 프로세스는 앞서 다루었듯이 독립적이기 때문에 에러가 나든 말든 계속해서 다른 프로세스들은 동작을 수행한다.
# 하지만 특정 프로세스가 수행하면 다른 프로세스에도 영향을 미치는, 예외 전파 라는 기능이 필요하기도 한다.
# 이때, 사용하는 것이 spawn_link 이다.
spawn_link(fn -> raise "oops" end);

# 예외 전파를 통해 다른 프로세스도 일관적인 동작을 수행할 수 있다.
# 추가로 Supervisor 를 통해 프로세스를 감지하고, 필요할 때 재시작할 수 있다.
