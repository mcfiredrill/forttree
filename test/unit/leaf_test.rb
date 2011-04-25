require 'test_helper'

class LeafTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "valid leaf" do
    leaf = Leaf.new
    assert !leaf.valid?
    leaf.content = "Chillbert's vacation."
    assert leaf.valid?
    leaf.content = ""
    leaf.photo_file_name = "chillbert.jpg"
    assert leaf.valid?
  end
end
