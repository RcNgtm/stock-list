module StocksHelper
  def product_color(report)
    if report.product == "緩和医療"
    return 'bg_purple'  
    elsif report.product == "緩和定期"
    return 'bg_brown'
    elsif report.product == "医療"
    return 'bg_pink'
    else report.product == "定期"
    return 'bg_green'
    end
  end   
end
