require %q{test_helper}

class ArboristTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert_not_nil ::Arborist::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
