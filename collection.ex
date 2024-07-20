# 리스트 concat 및 subtract 하는 방법
IO.puts([1, 2, 3] ++ [4, 5, 6]);  # expect: [1, 2, 3, 4, 5, 6]. actual: nothing.
IO.puts(["aa", "bb"] -- ["bb"]);  # expect: ["aa"] actual: aa

# 실제로는 subtract만 될 뿐, concat은 동작하지 않는다..
# 그 이유는 단순한데, IO.puts() 는 리스트를 그대로 출력하는 대신, ASCII 코드로 인식할 수 있는
# 문자 리스트를 출력하고자 하기 때문으로, IO.inspect() 를 사용해야 한다고 한다.
IO.inspect([1, 2, 3] ++ [4, 5, 6]);

# 참고로 hd 와 tl 는 빈 리스트인 경우, 에러를 발생한다고 한다.
list = ["Head", "Body", "Tail"];
IO.puts(hd(list));
IO.inspect(tl(list));

# Tuple.
# 튜플은 그 안에 여러 다른 구조를 저장하는 데이터 구조이기도 한다.
# 목록과 달리 연속된 메모리 블록에 요소를 저장합니다.
# 이는 인덱스당 튜플 요소에 액세스하거나 튜플 크기를 얻는 것이 빠른 작업임을 의미합니다.
# 인덱스는 0부터 시작합니다.
sample = { :ok, "Hello" };
IO.puts(tuple_size(sample));  # expected: 2

# Tuple.append() 는 튜플을 새롭게 만들어 반환한다.
sample = Tuple.append(sample, :world);
IO.inspect(sample);           # expected: { :ok, "Hello", :world }

# 추가적으로 put_elem 은 새로 element 를 추가하는 것은 불가능하며, 수정만 가능하다.
# 만일 강제로 할 경우, out of range 라는 메시지와 함께 에러가 발생한다.

# insert_at 을 사용하면 해당 index 에서 새롭게 value 를 추가하기도 한다.
# 이 역시 Tuple.append() 와 마찬가지로 새로운 튜플을 만들어 반환하기에 따로 할당해줘야한다.
# 아마 call by value로 인해 새로 할당해줄 수 밖에 없는 것 같기도 하다. -> 사실은 모든 것들이 불변으로 지켜지기 때문이라고 한다..
sample = Tuple.insert_at(sample, 0, :foo);
IO.inspect(sample);           # expected : { :foo, :ok, "Hello", :world }
