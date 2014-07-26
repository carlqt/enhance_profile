module ApplicationHelper
  def month_name(num)
    month = %w(Jan Feb March April May June July Aug Sept Oct Nov Dec) 
    month[num.to_i - 1]
  end
end
