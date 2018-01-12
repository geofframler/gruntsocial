class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # def show
  #   @user = User.find(params[:id])
  #   @micropost = Micropost.find(micropost_params[:id])
  # end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Grunted!"
      redirect_back(fallback_location: '/')
    else
      flash[:danger] = "Grunts can not be empty. Please try again."
      redirect_back(fallback_location: '/')
    end
  end

  def destroy
    @micropost.destroy
    flash[:warning] = "Ungrunted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
