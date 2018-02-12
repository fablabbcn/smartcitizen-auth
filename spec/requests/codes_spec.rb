require "spec_helper"
require "rails_helper"

RSpec.describe "Status codes", :type => :request do
  it "checks status code" do
    get "/"
    expect(response).to have_http_status(200)
  end
end
