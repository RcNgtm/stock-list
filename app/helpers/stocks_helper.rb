module StocksHelper
  def product_color(report)
    if report.product == "医療保険"
    return 'bg_pink'  
    else report.product == "定期保険"
    return 'bg_green'
    end
  end   
end
