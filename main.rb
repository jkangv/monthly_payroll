require 'csv'
require_relative 'employee'
require_relative 'sales'
require_relative 'owner'
require_relative 'quota_sales_person'
require_relative 'commission_sales_person'

employees = []
Employee::EMPLOYEES.each do |array|
  if array[3] == "owner"
    employees << Owner.new(array[0],array[1],array[2].to_i)
  elsif array[3] == "quota salesperson"
    employees << QuotaSalesPerson.new(array[0],array[1],array[2].to_i)
  elsif array[3] == "commission salesperson"
    employees << CommissionSalesPerson.new(array[0],array[1],array[2].to_i)
  else
    employees << Employee.new(array[0],array[1],array[2].to_i)
  end
end
employees.each do |employee|
  puts
  puts "***#{employee.first_name} #{employee.last_name}***"
  puts "Gross Salary: $#{employee.gross_salary}"
  puts "Commission: $#{employee.commission_pay}" if employee.is_a?(CommissionSalesPerson)
  puts "Quota sales bonus: $#{employee.quota_bonus}" if employee.is_a?(QuotaSalesPerson)
  puts "Owner monthly quota bonus: $#{employee.bonus}" if employee.is_a?(Owner)
  puts "Net pay: $#{employee.net_pay}"
  puts
end
