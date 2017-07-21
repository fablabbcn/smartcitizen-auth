class SessionsController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'net/https'

  def new
    redirect_to 'http://example.smartcitizen.me' if current_user
  end

  def create
    if params[:reset]
      reset_password
      # TODO: What is the best way here? Notify the user it has an email?
      redirect_to '/', notify: 'Please check your email to reset the password.'
      return
    end
    user = User.where("email = ? OR username = ?", params[:username_or_email], params[:username_or_email]).first
    if user && user.authenticate_with_legacy_support(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:user_return_to] || 'http://example.smartcitizen.me'), notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def reset_password
    uri = URI.parse("https://api.smartcitizen.me/v0/password_resets?email=#{params[:username_or_email]}")
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    req = Net::HTTP::Post.new(uri.path)
    form_data = URI.encode_www_form({:email => params[:username_or_email] })
    req.body = form_data
    res = https.request(req)

    puts res.body
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
