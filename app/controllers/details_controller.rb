class DetailsController < ApplicationController

  def new
    @detail = Detail.new
  end

  def create
    Detail.create!(detail_params)
    redirect_to new_report_path
  end


  private

  def detail_params
    params.require(:detail).permit(:reportname, :deadline)
  end

end
