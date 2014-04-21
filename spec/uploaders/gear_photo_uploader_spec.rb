require 'spec_helper'
require 'carrierwave/test/matchers'

describe GearPhotoUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    GearPhotoUploader.new(FactoryGirl.build(:sale), :image)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/valid_image.png')
  end

  before do
    GearPhotoUploader.enable_processing = true
  end

  after do
    GearPhotoUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end
