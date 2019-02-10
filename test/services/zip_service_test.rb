require 'test_helper'
class ZipServiceTest < ActiveSupport::TestCase

  test "Initalized properly" do
    zip_service = ZipService.new(93001).perform
    assert zip_service.present?
  end

end
