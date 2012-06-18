require 'spec_helper'
require 'carrierwave/test/matchers'




describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    @user = User.new
    @uploader =  ImageUploader.new(@user, :image)
    p = File.open('public/uploads/photo/image/1/burney_falls.jpg')
    @uploader.store!(p)
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 200 by 200 pixels" do
      @uploader.thumb.should have_dimensions(200,200)
    end
  end

  #context 'the small version' do
  #  it "should scale down a landscape image to fit within 200 by 200 pixels" do
  #    @uploader.small.should be_no_larger_than(200, 200)
  #  end
  #end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644) #600
  end
end