class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :sum_stocks


  def index
    @reports = Report.includes(:detail).order(:detail_id).order(:product)
  end

  def show
    @stock = Stock.new
    @report = Report.find(params[:id])
  end

  def create
    Stock.create!(stock_params)
    redirect_to root_path
  end

  private
  def stock_params
    params.require(:stock).permit(:movedate, :num, :report_id).merge(user_id: current_user.id)
  end
  def sum_stocks
    @sum_stocks = Stock.group(:report_id).sum(:num)
  end
end
