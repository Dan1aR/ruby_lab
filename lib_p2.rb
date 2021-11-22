# frozen_string_literal: true

# Here is class Sick
class Sick
  attr_reader :surname, :age

  def initialize(surname, age)
    @surname = surname
    @age = age
  end

  def info
    "#{surname} #{age}"
  end

  def print_info
    puts info
  end
end

# Here is class HospitalSick
class HospitalSick < Sick
  attr_reader :last_ye

  def initialize(surname, age, last_examination_year)
    super(surname, age)
    @last_ye = last_examination_year
  end

  def last_examination_year
    @last_ye
  end

  def info
    "#{super} #{last_examination_year}"
  end

  def print_info
    puts info
  end

  def next_examination_year
    last_examination_year + 3
  end
end
