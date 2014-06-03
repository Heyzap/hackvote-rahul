class HackdaysController < ApplicationController
  def new
		@hackday = Hackday.new
  end

	def index
		@hackdays = Hackday.all
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
		@hackday = Hackday.find(params[:id])
	end

	private
	def hackday_params
		params.require(:hackday).permit(:name)
	end
end
