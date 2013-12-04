class Sales
  sales_data = IO.read('sales_data.csv')
  sales_data = CSV.parse("#{sales_data}")
  sales_data.delete_at(0)
  SALES = sales_data

  def self.total_sales
    total_sales = {}
    SALES.each do |array|
      if total_sales.has_key?(array[0])
        total_sales[array[0]] += array[1].to_i
      else
        total_sales[array[0]] = array[1].to_i
      end
    end
    total_sales
  end

  def self.show_list
    Sales.total_sales.each do |name, sales|
      puts "#{name}: $#{sales}"
    end
  end

  def self.monthly_quota
    monthly_quota = 0
    Sales.total_sales.each do |name, sales|
      monthly_quota += sales
    end
    monthly_quota
  end
end
