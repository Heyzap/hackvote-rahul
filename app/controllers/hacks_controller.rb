class HacksController < ApplicationController
  before_filter :find_hackday#, :set_votes

  def index
    @hacks = @hackday.hacks.all
  end
  
  def show
    @hack = @hackday.hacks.find_by_id(params[:id])
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

	def submit_vote
    @hack = Hack.find_by_id(params[:hack_id])
		puts get_num_votes(@hackday).to_s + " GET_NUM_VOTES_VALUE"
    if get_num_votes(@hackday) > 0
      decrease_votes(@hackday)
			@hack.class.update_counters @hack.id, :votes => 1
      @hack.save
      flash[:success] = "Thanks you for voting"
    else
      flash[:error] = "You have already voted 3 times"
    end
    redirect_to hackday_hacks_path(params[:hackday_id])
	end

	protected

	NUM_VOTES = 3

  def find_hackday
    @hackday = Hackday.find_by_id(params[:hackday_id])
  end

  def get_num_votes(hackday)
		@votes = session[:hackday_id][:votes]
		if (!@votes)
			session[:hackday_id] = {}
			session[:hackday_id][:votes] ||= NUM_VOTES
		end
		return session[:hackday_id][:votes]
  end

  def decrease_votes(hackday)
		@votes = session[:hackday_id][:votes]
		@votes -=1
  	session[:hackday_id][:votes] = @votes
  end

  private
  def hack_params
    params.require(:hack).permit(:title, :people)
  end
end
