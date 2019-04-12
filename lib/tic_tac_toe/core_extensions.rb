class Array
  def all_equal?
    self.all { |a| a == self[0] }
  end

  def all_empty?
    self.all { |a| a.to_s.empty? }
  end

  def any_empty?
    self.any { |a| a.to_s.empty ? }
  end

  def none_empty
    !self.any_empty
  end

end
