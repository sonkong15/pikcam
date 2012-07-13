# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  
  before do @user = User.new(name: "donnie", email: "donnie@yahoo.com", 
  	password: "foobar", password_confirmation: "foobar")
  		
  	subject { @user}

  	it { should respond_to(:name) }
  	it { should respond_to(:email) }	

  	it { should be_valid }

  	describe "when name not present" do
  		before {@user.name = "  "}
  		it { should_not be_valid }
  	end
  	describe "when email is not present" do
  		before { @user.email = " " }
  		it { should_not be_valid }
  	end
  	describe "name to long" do
  		before { @user.name = "a" * 21 }
  		it { should be_valid }
  		
  	end
  describe "wrong email fromat" do
  	it "should be_invalid" do
  	address = %w[user@foo,com user.foo,com foo@bar+baz.com]
  	address.each do |invalid_address|
  		@user.email = invalid_address
  		@user.should_not be_valid
  	end
  end
 end
	describe "right email right" do
	it "should be_valid" do
	address = %w[donnie@ymail.com a_US-er@f.b.org first.1st@gmail.cn]
	address.each do |valid_address|
		@user.email = valid_address
		@user.should be_valid
	end
	end
 end
 describe "users email address is alredy taken" do
 	before do
 	user_with_same_email = @user.dup
 	user_with_same_email.email = @user.email.upcase
 	user_with_same_email.save 
 	end
	it { should_not be_valid }
end
it { should respond_to(:name) }
it { should respond_to(:email) }
it { should respond_to(:password_digest) }
it { should respond_to(:password) }
it { should respond_to(:password_confirmation) }
it { should be_valid}

describe "when password not present" do
	before { @user.password = @user.password_confirmation =" " }
	it { should_not be_valid }
end

	describe "when password doesn't match password_confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid}
		
	end
	describe "password_confirmation should_not be nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid}
		
	end
end

 before do @user = User.new(name: "donnie", email: "donnie@yahoo.com", 
  	password: "foobar", password_confirmation: "foobar")

subject { @user }

	it { should respond_to(:authenticate) }

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }
	
	describe "with valid password" do
		it { should == found_user.authenticate(@user.password) }
		
	end
	
	describe "with invalid password" do
		let(:user_for_invalid_password) {found_user.authenticate("invalid") }

		it { should_not == user_for_invalid_password }
		specify { user_for_invalid_password.should be_false }
		
	end
	end
	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_valid }
		
	end

end
end
