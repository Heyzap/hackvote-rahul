class HacksController < ApplicationController
  before_filter :find_hackday

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
		set_votes(@hackday)
		#set_votes
  end

  def get_num_votes(hackday)
    return session[:votes]
  end

  def decrease_votes(hackday)
    @votes = session[:votes]
    @votes -= 1
    session[:votes] = @votes
  end

  def set_votes(hackday)
    session[]["votes".to_i] ||= NUM_VOTES
    #session[:votes] ||= NUM_VOTES
  end

  private
  def hack_params
    params.require(:hack).permit(:title, :people)
  end
end
