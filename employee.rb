class Employee
  TAX_RATE = 0.3
  employee_data = IO.read('employee_data.csv')
  EMPLOYEES = CSV.parse("#{employee_data}")

  attr_reader :first_name, :last_name, :net_pay

  def initialize(first_name,last_name, salary)
    @first_name = first_name
    @last_name = last_name
    @salary = salary
  end

  def self.employee_list
    employees = {}
    EMPLOYEES.each do |array|
      employees[array[0] + " " + array[1]] = array[3]
    end
    employees
  end

  def self.show_list
    Employee.employee_list.each do |name, job|
      puts "#{name}: a (an) #{job}"
    end
  end

  def gross_salary
    gross_salary = @salary / 12.0
    gross_salary.round(2)
  end

  def net_pay
    net_pay = gross_salary * (1 - TAX_RATE)
    net_pay.round(2)
  end
end
