class TestMrubyAtomPubPostWsse < MTest::Unit::TestCase
  def setup
  end

  def test_get
    assert(AtomPubPost::Wsse::get('user', 'pass'))
  end

end

MTest::Unit.new.run