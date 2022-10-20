class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @report = Report.new
    @data = Detail.all
  end

  def create
    Report.create!(report_params)
    redirect_to root_path
  end


  private

  def report_params
    params.require(:report).permit(:product, :detail_id)
  end

end
