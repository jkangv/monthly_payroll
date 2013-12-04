class Owner < Employee
  def bonus
    if Sales.monthly_quota > 250000
      bonus = 1000
    else
      bonus = 0
    end
    bonus
  end
  def net_pay
    super + (bonus * (1 - TAX_RATE))
  end  
end
