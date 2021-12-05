# frozen_string_literal: true

def circle_area(rad, eps)
  iters = 0
  n = 4
  area = 0
  s2 = 0
  loop do
    s1 = s2
    s2 = 0.5 * rad**2 * n * Math.sin(2 * Math::PI / n)
    area += s2 - s1
    n *= 2
    iters += 1
    break if s2 - s1 < eps
  end
  area
end

def circle_area_advanced(rad, eps)
  area_f = ->(radius, n) { 0.5 * radius**2 * n * Math.sin(2 * Math::PI / n) }
  e = Enumerator.new do |y|
    n = 4
    area = 0.0
    loop do
      y.yield(area, area_f.call(rad, n))
      area = area_f.call(rad, n)
      n *= 2
    end
  end
  e.find { |s1, s2| s2 - s1 < eps }.last
end

def maximb
  yield if block_given?
end
