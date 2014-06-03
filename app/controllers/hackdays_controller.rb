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

	def update
		@hackday = Hackday.find(params[:id])
		if params[:radioButton]
			@hack = @hack.find_by_id(params[:radioButton])
			if get_num_votes(@hackday) > 0
				decrease_votes(@hackday)
				@hack.votes = @hack.votes + 1
				@hack.save
			else
				flash[:error] = "Error. You have no votes left"
			end
		end
		redirect_to hackday_hacks_path
	end

	private

	NUM_VOTES = 3

	def hackday_params
		params.require(:hackday).permit(:name)
	end

	def get_num_votes(hackday)

	end

	def decrease_votes(hackday)

	end

end
