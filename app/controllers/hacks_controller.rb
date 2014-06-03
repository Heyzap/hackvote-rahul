class HacksController < ApplicationController
	before_filter :find_hackday

	def index
		@hacks = @hackday.hacks.all
	end
	
	def find_hackday
		@hackday = Hackday.find(params[:hackday_id])
	end

	def show
		@hack = @hackday.hacks.find(params[:id])
		puts @hack
	end

  def new
		@hack = @hackday.hacks.new
  end

	def create
		@hack = @hackday.hacks.new(hack_params)
		if @hack.save
			redirect_to hackday_hacks_path
		else
			render 'new'
		end
	end

	def update
		raise "In hacks controller"
	end

	private
	def hack_params
		params.require(:hack).permit(:title, :people)
	end
end
