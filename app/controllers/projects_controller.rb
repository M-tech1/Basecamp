class ProjectsController < ApplicationController

      # belongs_to :user
      before_action :authenticate_user!

      # GET method to get all projects from database   
      def index   
          @projects = current_user.projects
          #@project = current_user.projects.create(project_params)
          # @project = current_user.projects.create(project_params)
        #  @projects = Project.all 
                
      end   
       
      # GET method to get a project by id   
      def show   
        @project = Project.find(params[:id])  
        render :action => 'show' 
      end   
       
      # GET method for the new project form   
      def new   
        @project = Project.new   
      end   
       
      # POST method for processing form data   
     # @projects = current_user.projects


      def create  
      
        @project = Project.new(project_params)
        @project.user = current_user
        @project.save
        redirect_to projects_path


        # @project = Project.new(project_params)   
        # if @project.save   
        #   flash[:notice] = 'project added!'   
        #   redirect_to new_project_url  
        # else   
        #   flash[:error] = 'Failed to edit project!'   
        #   render :new   
        # end   
      end   
       
       # GET method for editing a project based on id   
      def edit   
        @project = Project.find(params[:id]) 
        render :edit  
      end   
       
      # PUT method for updating in database a project based on id   
      def update   
        @project = Project.find(params[:id])   
        if @project.update(project_params)   
          flash[:notice] = 'project updated successfully!'   
          redirect_to edit_project_path(@project.id)
        else   
          flash[:error] = 'Failed to edit project!'   
          render :edit   
        end   
      end   
       
      # DELETE method for deleting a project from database based on id   
      def destroy  
        # @project = Project.find(params[:id])

        # if current_user == @project.user || current_user.admin == true
        #   @project.destroy
        #   redirect_to projects_path, notice: "Project deleted successfully"
        # else
        #   redirect_to project_url, alert: "You are not authorized to delete this project"
        # end
        
        

        
        project = Project.find(params[:id])   
        # if project.destroy   
        if @project.destroy(project_params)
          flash[:notice] = 'project deleted!'   
          redirect_to projects_path   
        else   
          flash[:error] = 'Failed to delete this project!'   
          render :destroy   
        end   
      end     
      
      def shared
        @projects = Project.all  
      end

      def created
        @projects = Project.all  
      end

      protected

      # validation of params   
      def project_params   
        params.permit(:name, :description)   
      end   


      #new controls
      def show
        @users = User.all
      end

      def profile_page
        @user = current_user
      end
      #*******************
end


