class QuotaSalesPerson < Employee
  def quota_salespeople
    people = {}
    Employee::EMPLOYEES.each do |array|
      people[array[1]] = [array[4].to_i,array[5].to_i] if array[3] == "quota salesperson"
    end
    people
  end

  def quota_bonus
    if quota_salespeople[self.last_name][1].to_i > Sales.total_sales[self.last_name].to_i  
      quota_salespeople[self.last_name][0] / 12
    else
      0
    end
  end

  def net_pay
    super + (quota_bonus * (1 - TAX_RATE))
  end
end
