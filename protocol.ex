defprotocol Blank do
  def blank?(data)
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

defimpl Blank, for: BitString do
  def blank?(""), do: true
  def blank?(_), do: false
end

IO.puts(Blank.blank? []);
IO.puts(Blank.blank? [:true]);
IO.puts(Blank.blank?(""));
IO.puts(Blank.blank?("good at cooding"));

IO.puts(Blank.blank?(45));    # 예외 발생함. 정의된 타입 이외에 다른 타입 사용하면 에러 발생함
