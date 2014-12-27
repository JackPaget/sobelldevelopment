class SessionsController < ApplicationController
  def new
  	@staff = Staff.authenticate(params[:username], params[:password])
  	if @staff
  		session[:staff_id] = @staff.id
  		redirect_to root_url
  	else
  		session[:staff_id] = nil
  		render :action => "new"
  		flash[:notice] = "Wrong"
  	end
  end

  def destroy
  	session[:staff_id] = nil
  	redirect_to root_url
  end
end
