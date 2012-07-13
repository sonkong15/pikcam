require 'spec_helper'

describe "UserPages" do
	subject { page } #tell me what we want to run the test on this page 
  
  describe "signup page" do
  	before {visit signup_path}
  		
    it { should have_selector("h1", text: "sign up") }
    

    end
  end

