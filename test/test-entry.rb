class TestMrubyAtompubPostEntry < MTest::Unit::TestCase
  def setup
    @conf = AtomPubPost::Config.new(File.dirname(__FILE__)+'/test.conf')
    @parser = AtomPubPost::Parser.new(@conf, nil)
  end

  def test_initialize
    entry = AtomPubPost::BlogEntry.new("test")
    assert_equal("test", entry.title)
    assert_equal(nil, entry.category)
    assert_equal("", entry.content)
    entry = AtomPubPost::BlogEntry.new("test2", "hoge", "huga")
    assert_equal("test2", entry.title)
    assert_equal("hoge", entry.category)
    assert_equal("huga", entry.content)
  end


  def test_get_entry_info
    
  end


end

class TestMrubyAtompubPostPostEntry < MTest::Unit::TestCase
  def test_to_xml
  end
end
MTest::Unit.new.run
