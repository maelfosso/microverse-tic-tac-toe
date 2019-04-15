class Array
  def all_equal?
    all? { |a| a == self[0] }
  end

  def all_empty?
    all? { |a| a.to_s.empty? }
  end

  def any_empty?
    any? { |a| a.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end
