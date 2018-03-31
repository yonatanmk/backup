require_relative './cage.rb'
require_relative './employee.rb'

class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :name, :cages, :employees

  def initialize (name, season_opening_date, season_closing_date)
    @name = name
    @cages = []
    10.times {@cages << Cage.new}
    @employees = []
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date < @season_closing_date && date > @season_opening_date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    output = @employees.reduce('') {|greeting, employee| greeting + employee.greet + "\n"}
    output += @cages.reduce('') {|greeting, cage| cage.animal ? greeting + cage.animal.speak + "\n" : greeting}
    return output
  end
end
