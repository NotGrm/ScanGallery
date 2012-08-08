require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save chapter without number" do
  	page = Page.new
  	assert !page.save, "Saved the page without a number"
  end

end
