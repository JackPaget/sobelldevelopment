class StaffController < ApplicationController
  def new
  	@staff = Staff.new
  end

  def create
  	if @staff = Staff.new(params[:staff])
  		session[:staff_id]= @staff.id
  		redirect_to root_url
  	else
  		render :action => "new"

  	end
  end
end
