class StocksController < ApplicationController

  def index
    @reports = Report.includes(:detail)
  end

  def show
    @stock = Stock.new
    @report = Report.find(params[:id])
  end

  def create
    Stock.create(stock_params)
    binding.pry
  end

  private
  def stock_params
    params.require(:stock).permit(:movedate, :num, :report_id).merge(user_id: current_user.id)
  end
end
