require 'spec_helper'
#require File.dirname(__FILE__) + '/../spec_helper'



describe ListsController do
  include Devise::TestHelpers

    before (:each) do
      @user = Factory.create(:user)
      sign_in @user
    end

    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "should be successful" do
        get 'new'
        response.should be_success
      end
    end

    describe "GET 'create'" do
      before (:each) do
         @list = Factory.create(:list)
         @attr = Factory.attributes_for(:list)
      end

      it "should create a project" do
        lambda do
          post :create, :list => @attr
        end.should change(List, :count).by(1)
      end
      #
      #it "should redirect correctly upon creating" do
      #     post :create, :list => @attr
      #     response.should redirect_to(lists_path)
      # end
    end













  #
  #describe "GET 'new'" do
  #  it "should be successful" do
  #    get 'new'
  #    puts "$$$$$$$$$"
  #    puts response.body.inspect
  #    puts response.status.inspect
  #    response.should redirect_to :action => 'new'
  #  end
  #end
=begin
  describe "GET 'new'" do
    def do_get(params = {})
      stubbing(Teaser) do |teaser|
        get :show, {id => teaser.id}.merge(params)
        yield(teaser)
      end
    end
=end
#
#  describe "GET 'index'" do
#    it "should be successful" do
#      get 'index'
#     # response.should be_success
#      response.should redirect_to lists_path
#    end
#  end
#    end
end



