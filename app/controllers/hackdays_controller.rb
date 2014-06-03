class HackdaysController < ApplicationController
	before_filter :set_votes

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
		@hack = Hack.find_by_title(params[:votes])
		if get_num_votes(@hackday) > 0
			decrease_votes(@hackday)
			@hack.votes = @hack.votes + 1
			@hack.save
			flash[:success] = "Thanks you for voting"
		else
			flash[:error] = "You have already voted 3 times"
		end
		redirect_to hackday_hacks_path(params[:id])
	end

	private

	NUM_VOTES = 3

	def hackday_params
		params.require(:hackday).permit(:name)
	end

	def get_num_votes(hackday)
		return session[:votes]
	end

	def decrease_votes(hackday)
		@votes = session[:votes]
		@votes -= 1
		session[:votes] = @votes
	end

	def set_votes
		session[:votes] ||= NUM_VOTES
	end
end
