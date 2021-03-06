require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should update number for a new record" do
    page = Page.new(chapter: chapters(:one))
    page.valid?
    assert_not_nil page.number, "Page number not set for new record"
  end
  
  test 'should not update number for an old record' do
    page = Page.create(chapter: chapters(:one))
    number = page.number
    page.chapter = chapters(:two)
    page.valid?
    assert_equal page.number, number, "Page number has changed."
  end

  test 'should return next chapter first page' do
    page = pages(:page_two)
    assert_equal page.next_page, pages(:other_page_one)
  end

  test 'should return previous chapter last page' do
    page = pages(:other_page_one)
    assert_equal page.previous_page, pages(:page_two)
  end

end
