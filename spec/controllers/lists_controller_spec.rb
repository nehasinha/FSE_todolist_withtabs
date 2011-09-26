require 'spec_helper'
#require File.dirname(__FILE__) + '/../spec_helper'


describe ListsController do
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      puts "$$$$$$$$$"
      puts response.body.inspect
      puts response.status.inspect
      response.should redirect_to :action => 'new'
    end
  end
=begin
  describe "GET 'new'" do
    def do_get(params = {})
      stubbing(Teaser) do |teaser|
        get :show, {id => teaser.id}.merge(params)
        yield(teaser)
      end
    end
=end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
     # response.should be_success
      response.should redirect_to lists_path
    end
  end
    end


