class HacksController < ApplicationController
	
	def show
		@hack = Hack.find(params[:id])
		puts @hack
	end

  def new
		@hack = Hack.new
  end

	def create
		#@hack = Hack.new(hack_params)
		@hack = @hackday.hacks.new(hack_params)
		if @hack.save
			#do something 
		else
			render 'new'
		end
	end

	def index
		@hack = Hack.all
	end

	private
	def hack_params
		params.require(:hack).permit(:title, :people)
	end
end
