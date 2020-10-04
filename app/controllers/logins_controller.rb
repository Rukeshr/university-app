class LoginsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]

    def new
    end

    def create
        student = Student.find_by(email: params[:logins] [:email].downcase)
        if student && student.authenticate(params[:logins] [:password])
            session[:student_id] = student.id
            flash[:notice] = "You're successfully logged in"
            redirect_to student
        else
            flash.now[:notice] = "Something is wrong in your crendtials"
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:notice] = "You're successfully logged out"
        redirect_to root_path
    end

end