class SessionsController < ApplicationController
  
  def new 
    
  end
  
  def create 
    #render 'new'
    user = User.find_by_email(params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password]) && user.approved?
      #  Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_back_or user
      #flash.now[:success] = 'Welcome'
    else
      # Create an error message and re-render the signin form.
      flash.now[:error] = 'Invalid email/password combination or account not activated' 
      render 'new'
    end
  end
  
  def destroy
    
    sign_out
    flash.now[:notice] = 'Signed out'
    render 'new'
    
  end
  
end
