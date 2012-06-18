require 'spec_helper'

describe "Galleries" do
  describe "GET /galleries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get galleries_path
      response.status.should be(200)
      puts response.status
    end
  end
end


describe "select a Gallery" do
    it "should display all the photos in the gallery" do
      #get galleries_path
      #response.status.should be(200)
      g = Gallery.find(1)
      get gallery_photo_path(g)
      response.status.should be(200)
      puts response.status
    end
end