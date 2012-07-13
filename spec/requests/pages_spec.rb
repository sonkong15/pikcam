require 'spec_helper'

describe "Pages" do

	describe "Home" do
		it "should have h1 home" do
			visit root_path
			page.should have_selector("h1", text: "Homes" )
			
		end
		
	end
 
  describe "help page" do
    
    it "should have h1" do
    	visit('/help')
    	page.should have_selector("h1" , :text =>'help')
    	
    end
    it "should have title" do
    	visit('/help')
    	page.should have_selector("title" , :text =>'The Brands | help')
    	
    end
end
describe "about" do
		it "should have about page"do
		visit("/about")
		page.should have_selector('title',
			text: " The Brands | About")
		end
		it "should be about" do
			visit about_path
			page.should have_selector("h1", text: "About")
			click_link "Home"

			
		end
		

	end


end
