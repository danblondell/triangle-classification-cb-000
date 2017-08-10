class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [side1, side2, side3]
  end

  def kind
    if @all_sides.any? { |side| side <= 0 }
      raise TriangleError
    elsif @all_sides.any? { |side| side >= (@all_sides.inject{|sum, side| sum + side} - side) }
      raise TriangleError
    elsif @all_sides.uniq.length == 1
      :equilateral
    elsif @all_sides.uniq.length == 2
      :isosceles
    elsif @all_sides.uniq.length == 3
      :scalene
    end
  end

end

class TriangleError < StandardError
end
