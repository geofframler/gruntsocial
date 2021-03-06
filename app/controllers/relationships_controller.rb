class RelationshipsController < ApplicationController
  before_action :logged_in_user

  include ActionView::Helpers::UrlHelper

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {
        user_name = @user.name
        flash[:success] = "Followed #{user_name}"
        redirect_back(fallback_location: '/')
      }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {
        user_name = @user.name
        flash[:warning] = "Unfollowed #{user_name}"
        redirect_back(fallback_location: '/') }
      format.js
    end
  end

end
