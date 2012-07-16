require 'spec_helper'

describe UserSessionController do

  describe "GET 'email:string'" do
    it "returns http success" do
      get 'email:string'
      response.should be_success
    end
  end

  describe "GET 'password:string'" do
    it "returns http success" do
      get 'password:string'
      response.should be_success
    end
  end

end
