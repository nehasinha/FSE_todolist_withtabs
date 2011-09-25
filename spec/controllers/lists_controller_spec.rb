#require 'spec_helper'
require File.dirname(__FILE__) + '/../spec_helper'


describe ListsController do
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_true
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_true
    end
  end
end

