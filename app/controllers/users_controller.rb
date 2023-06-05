class UsersController < ApplicationController

    #  has_many :projects, dependent: :destroy
    #  validates :name, presence: true
    #  validates :email, presence: true
    #  validates :password, length: {minimum: 5}

     # GET method to get all users from database   
     def index   
      @users = User.all   
    end   
     
    # GET method for the new user form   
    def new     
      render layout: false
      @user = User.new 
    end   
     
    # POST method for processing form data   
    def create   
      @user = User.new(user_params)   
      if @user.save   
        flash[:notice] = 'Registered successfully!' 
        redirect_to users_login_url
        # redirect_to new_project_url  
      else   
        flash[:error] = 'Failed to create account!'   
        render :new   
      end   
    end 
    
    # GET method to get a user by id   
    def show   
      @user = User.find(params[:id])   
    end   
     


     # GET method for editing a user based on id   
    def edit   
      @user = User.find(params[:id])   
    end   
     
    # PUT method for updating in database a user based on id   
    def update   
      @user = User.find(params[:id])   
      if @user.update(user_params)   
        flash[:notice] = 'user updated!'   
        redirect_to user_index_path
     
      else   
        flash[:error] = 'Failed to edit user!'   
        render :edit   
      end   
    end   
     
    # DELETE method for deleting a user from database based on id   
    def destroy_user   
      @user = User.find(params[:id])   
      if @user.delete   
        flash[:notice] = 'user deleted!'   
        redirect_to root_path   
      else   
        flash[:error] = 'Failed to delete this user!'   
        render :destroy   
      end   
    end   

####################### # new testing code

def remove_from_admin
  if current_user.admin == true
    @user = User.find(params[:id])
    #@user.update(admin: false)
    @user.admin = false
    @user.save
    redirect_to home_show_path
  end
end


def add_admin
  if current_user.admin == true
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    redirect_to home_show_path
  end
end


def authorize_admin
  unless current_user.admin == true
    redirect_to root_path, alert: "You do not have permission to delete user"
  end
end

def destroy_user
  if current_user.admin == true
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_show_path, notice: "User has been deleted successfully"
  end
end


def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to root_path, notice: 'User successfully deleted.'
end




########################## tesging ###########################

    def login
      render layout: false
    end


    def sign_in
      render layout: false
    end

    # POST method for processing form data   
    def add_user   
      @user = User.new(user_params)   
      if @user.save   
        flash[:notice] = 'Registered successfully!' 
        redirect_to add_new_user_url    
      else   
        flash[:error] = 'Failed to create account!'   
        render :adduser   
      end   
    end 

    protected

    # validation of params   
    def user_params   
      params.permit(:name, :email, :password, :role)   
    end   

    
end
