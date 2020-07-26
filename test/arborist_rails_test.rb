require %q{test_helper}

class ArboristRailsTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert ::ArboristRails::VERSION.present?
  end

  def test_it_does_something_useful
    assert true
  end
end
