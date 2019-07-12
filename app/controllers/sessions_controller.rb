class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email]).
                 try(:authenticate, params[:password])

    return render action: 'new' unless @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
