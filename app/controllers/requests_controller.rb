class RequestsController < ApplicationController
  def new
    @user = current_user
    @location = Location.find(params[:id])
  end
  
  # POST /requests/:id
  # Authorize new location
  def create
    @user = current_user
    @location = Location.find(params[:id])
    @user_location = UserLocation.new({ :user_id => @user.id, :location_id => @location.id, :login_name => params[:request][:login_name] })
    
    old_password = params[:request][:old_password]
    
    if @user.sync_password.blank?
      new_password = request_password
    else
      new_password  = @user.sync_password
    end
    
    request = request_github(@user_location.login_name, old_password, new_password)
    
    unless request.nil?
      # TXT user
      txt_user(@user.cell_phone, request)
      
      # Save new user location
      @user_location.save!
      
      # save new password to user
      @user.update_attributes({ :sync_password => request })
      
      redirect_to root_url, :notice => "New password TXT'd to your cell phone."
    else
      redirect_to root_url, :notice => 'Authentication Failed. Try again.'
    end
  end
  
  # POST /requests
  # Regenerate and sync for all accounts
  def update
    @user = current_user
    @user_locations = @user.user_locations
    
    old_password = @user.sync_password
    
    new_password  = request_password
    
    # @user_locations.each do |ul|
    request = request_github(@user.user_locations.where({ :location_id => 1 }).first.login_name, old_password, new_password)
    # end
    
    unless request.nil?
      # TXT user
      txt_user(@user.cell_phone, request)
      
      # Save new password to user
      @user.update_attributes({ :sync_password => request })
      
      redirect_to root_url, :notice => "New password TXT'd to your cell phone."
    else
      redirect_to root_url, :notice => 'Authentication Failed. Try again.'
    end
  end
  
  def request_password
    o = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    string = (0...8).map{ o[rand(o.length)] }.join
    string
  end
  
  def txt_user(phone, message)
    # put your own credentials here
    account_sid = ''
    auth_token  = ''
  
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    # send an sms
    @client.account.sms.messages.create(
      :from => '+17147708060',
      :to => "+#{phone}",
      :body => message
    )
  end
     
  def request_github(login_name, old_password, new_password)
    require 'mechanize'
    
    agent = Mechanize.new
    page  = agent.get('http://github.com/login')
    form  = page.forms.first
    
    form.login = login_name
    form.password = old_password
    
    logged_in_page = agent.submit(form, form.buttons.first)
    
    return nil if logged_in_page.link_with(:href => '/logout').nil?
    
    admin_page = agent.get('http://github.com/settings/admin')
    
    admin_form = admin_page.form_with(:id => "change_password")
    
    admin_form.field_with({ :name => 'user[old_password]' }).value = old_password
    admin_form.field_with({ :name => 'user[password]' }).value = new_password
    admin_form.field_with({ :name => 'user[password_confirmation]' }).value = new_password
    
    post_admin_page = agent.submit(admin_form, admin_form.buttons.first)
    
    return nil if post_admin_page.link_with(:href => 'https://github.com/login?return_to=%2Flogin').nil?
    
    return "#{new_password}"
  end
end
