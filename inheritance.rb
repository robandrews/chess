class Employee
  attr_accessor :employees, :salary, :name

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
    @bonus = 0
    @employees = []
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
    @bonus
  end

  def all_sub_salaries(employee)
    return employee.salary if employee.employees.empty?
    [employee.salary] + employee.employees.map { |e| e.all_sub_salaries(e) }
  end

end

class Manager < Employee

  def initialize (name, title, salary, boss = nil)
    super
  end

  def bonus(multiplier)
    @bonus = all_sub_salaries(self).flatten.inject(:+) * multiplier
  end


  def add_employee(employee)
    @employees << employee unless @employees.include?(employee)
  end
end

a = Manager.new("a", "boss", 100000)
b = Manager.new("b", "manager", 50000, a)
c = Employee.new("c", "grunt", 10000, b)
a.add_employee(b)
b.add_employee(c)