res = Enum.all?([1, 2, 3, 4], fn(s) -> rem(s, 2) == 1 end)
IO.inspect(res);    # expected: [1, 3]. actual: false

# false 가 뜬 이유는 모든 값들이, 원소들이 odd(홀수)가 아니기 때문이다.
# 내가 이해한거는 열거형 생성이었지만, 열거형으로 만듦과 동시에 체크하는 로직인 것 같다. (추측)

res = Enum.any?([1, 2, 3, 4], fn(s) -> rem(s, 2) == 1 end)
IO.inspect(res);    # expected: true

# 튜토리얼 예제에서는 chunk 이지만, chunk 는 deprecated 되었기에 chunk_every 로 대체
res = Enum.chunk_every([1, 2, 3, 4, 5, 6], 2);
IO.inspect(res);    # expected: [[1, 2], [3, 4], [5, 6]]

Enum.each([1, 2, 3], fn(s) -> IO.puts(s) end);
# expected:
# 1
# 2
# 3

res = Enum.map([1, 2, 3, 4, 5], fn(s) -> s * 2 end);
IO.inspect(res);    # expected: [2, 4, 6, 8, 10]

res = Enum.reduce([1, 2, 3, 4, 5], 5, fn(x, accum) -> x + accum end);
IO.inspect(res);    # 20. 초기값: 5. 만일 초기값이 없다면 0번째 원소값을 기준으로 계산함

res = Enum.reduce([1, 2, 3, 4, 5], fn(x, accum) -> x + accum end);
IO.inspect(res);    # 15

res = Enum.uniq([1, 2, 2, 3, 3, 3, 4, 7]);  # distinct 해줌
IO.inspect(res);    # [1, 2, 3, 4, 7]

# Eager Evaluation
odd? = &(rem(&1, 2) != 0)
res = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum
IO.puts(res);       # 7500000000

# Stream 은 지연 연산(Lazy)하지만, Enum 은 즉시(Eager) 연산함.
# 그래서 Enum은 pipeline이 있으면 중간중간 처리된 배열을 만들어냄
# Stream 은 Stream단위로 계산하고 나중에 한 번에 계산하기 때문에 대용량 처리 시에 유용함
odd? = &(rem(&1, 2) != 0);
res = 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum
IO.puts(res);
