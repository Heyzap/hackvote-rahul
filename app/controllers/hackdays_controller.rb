class HackdaysController < ApplicationController

  def index
    @hackdays = Hackday.all.reverse
  end

  def new
    @hackday = Hackday.new
  end

  def create
    @hackday = Hackday.new(hackday_params)
    if @hackday.save
      redirect_to hackdays_path
    else
      render 'new'
    end
  end

  def show
    @hackday = Hackday.find_by_id(params[:id])
		if @hackday
			return @hackday
		else
			render :nothing => true, :status => 400
		end
  end

  private

  def hackday_params
    params.require(:hackday).permit(:name)
  end
end
