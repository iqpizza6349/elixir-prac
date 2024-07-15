# 사칙 연산
# 그 중에서 좀 다른 거는 div와 rem 이다.
# div 는 몫이고, rem은 나머지이다.
IO.puts(div(10, 2));  # expected: 5
IO.puts(rem(10, 2));  # expected: 0

# 논리 연산
# 다른 게 있다면 &&, ||, ! 이 모두 있지만 엄격하게 체크하지 않고
# 첫 번째 인자가 bool 이라고 예상하지 않는 다고 하는 데, 무슨 의민지 모르겠음 :(
# 그리고 모든 논리 연산자는 첫 번째가 false 면 2번째 꺼를 체크하지 않는 다고 한다.
# 그럼 결과값이 false인 경우에는 어떻게 해야하는 거지?
IO.puts((true === :true || true === :false) === :false); #expected: false

# 비트 연산
# 사용하려면 Bitwise 를 import 해야함. 기존에는 use 였지만 deprecated 되었다고 한다.
import Bitwise;

# 참고로 Bitwise는 다른 언어들과 달리 2개가 아닌 3개다.
IO.puts(32 >>> 2)  # expected: 8
