# if 문
a = true;
if a === true do
  IO.puts("Variable a is true!");
else
  IO.puts("Variable a is false!");
end

# unless. 조건이 아닌 경우에만 동작함
unless a === true do
  IO.puts("Variable is not true!");
else
  IO.puts("Variable is true");
end

# cond condition 이 여러 개일 때 쓰면 유용할 듯
# 따로 switch case 처럼 break 같은 게 필요없음
# 그리고 default 대신, true 니까 뭔가 직관적이진 않지만
# 그래도 무난함
cond do
  a === true  -> IO.puts("a is true!");
  a === false -> IO.puts("a is false!");
  true        -> IO.puts("I give up");
end

# cond 이랑 비슷함. 대신, 기준점을 두고 처리 가능
case a do
  true        -> IO.puts("true!");
  false       -> IO.puts("false!");
  _           -> IO.puts("Oops, you don't match");
end
