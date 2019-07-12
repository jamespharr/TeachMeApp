class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

def lessons
  user = User.find(params[:id])
  render json: user.lessons.group_by{ |lesson| Date.parse(lesson.start_time).strftime("%Y-%m-%d") }
end

  # GET /users/1
  def show
    @user = User.find(params[:id ])
    @my_lessons = @user.lessons
    @my_reviews = @my_lessons.map{ |x| x.reviews }.flatten
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        # flash[:success] = "User created"
        redirect_to user_path(@user), notice: "Welcome to Teach Me"
    else
        flash[:warning] = "Invalid email or password"
        redirect_to '/signup'
    end
  end

  # PATCH/PUT /users/1

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :address, :city, :state, :zip_code, :avatar)
    end
end
