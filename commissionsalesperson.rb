class CommissionSalesPerson < Employee
  def commission_salespeople
    people = {}
    Employee::EMPLOYEES.each do |array|
      people[array[1]] = array[4].to_f if array[3] == "commission salesperson"
    end
    people
  end

  def commission_pay
    Sales.total_sales[self.last_name] * commission_salespeople[self.last_name]
  end

  def net_pay
    super + (commission_pay * (1 - TAX_RATE))
  end
end
