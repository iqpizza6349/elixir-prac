# String 클래스를 사용해서 문자열 유틸 기능들이 포함되어있다.
a = ""
if String.length(a) === 0 do
   IO.puts("a is an empty string")
end

# 문자열 format 하는 방법
x = "World";
y = "Hello, #{x}!"
IO.puts(y);

# Concat 할 때는 <> 를 쓴다고 한다... 왜 + 연산자를 안 쓸까?
aa = "Dark"
bb = "Knight"
cc = aa <> " " <> bb;
IO.puts(cc);

# 문자열 매칭 r는 regex 의 약자로 보인다.
IO.puts(String.match?("foo", ~r/foo/));
IO.puts(String.match?("bar", ~r/foo/));

# =~ 으로 match 대체 가능하다. 근데 가독성은 안 좋을 듯?
IO.puts("foo" =~ ~r/foo/);

# 물론 regex 를 변수에 할당하는 것 역시 가능하다.
format = ~r/foo/;
IO.puts("foo" =~ format);

# <> 의 진실.
# 사실 저건 binary concat 할 때 사용하는 거였다.
# 하지만 결국 문자열도 binary 배열이니 저렇게 해도 동작하는 것이었다.

# char 는 작은 따옴표, string 은 큰 따옴표로 구분짓는다. (다른 정적 언어들과 동일 혹은 유사)
IO.puts('Hello');
IO.puts(is_list('Hello'));

# 그래서 char 에서 문자열로 만들려면 to_string 을 사용하면 되고,
# string 에서 char 로 만들려면 to_char_list 를 사용하면 된다.
IO.puts(is_list(to_char_list("Hello")));
IO.puts(is_binary(to_string(~C"Hello")));
# 참고로 ~C""인 편을 '' 보다 더 선호한다고 한다.
