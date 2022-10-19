class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @report = Report.new
    @data = Detail.all
  end

  def create
    Report.create!(stock_params)
    redirect_to root_path
  end


  private

  def stock_params
    params.require(:report).permit(:product, :detail_id)
  end

end
