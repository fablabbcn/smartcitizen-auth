require "spec_helper"
require "rails_helper"

RSpec.describe "Status codes", :type => :request do
  it "checks status codes" do
    get "/"
    expect(response).to have_http_status(200)
    # page should have 3 buttons
    # Log In
  end

  it "when not logged in" do
    get "/users"
    expect(response).to have_http_status(200)
    expect(response.body).to include('User info')
    expect(response.body).to include('Not logged in')
    # page should have 'User info' and 'Logged in'
  end

  it "visits logout and redirects you" do
    get '/logout'
    expect(response).to have_http_status(302)
    # page should have 'Logged out!'
  end

  describe "when logged in" do
    #let(:user) {User.create!(username: 'myuser', password: '123456', password_confirmation: '123456', legacy_api_key: 'asdfasfdasfd')}
    #u = User.create!(username: 'myuser', password: '123456', password_confirmation: '123456', legacy_api_key: 'asdfasfdasfd')
    it "should log you in and get user info" do
      get "/users"
      expect(response.body).to include('Not logged in')
      #expect(response.body).to include('Logged in as')
    end
  end
end
