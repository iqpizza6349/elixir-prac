defmodule Calc do
  def sum(a, b) do
    a + b
  end
end

IO.puts(Calc.sum(10, 15));  # expect: 25

# 해당 파일 확장명을 script 모드, exs 로 설정하면 bin 파일(beam)이 생성되지 않는다.

# 하위와 같이 Nested(중첩) 모듈도 정의 가능하다.
defmodule Foo do
  defmodule Bar do
    # do-something
  end
end
