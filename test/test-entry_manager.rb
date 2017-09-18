class TestMrubyAtompubPostEntryManager < MTest::Unit::TestCase
  def setup
    config_file = File.dirname(__FILE__) + "/test.conf"
    conf = AtomPubPost::Config.new(config_file)
    @em = AtomPubPost::EntryManager.new(File.dirname(__FILE__) + "/test.yaml")
  end
  
  def test_save_edit_uri
    @em.save_edit_uri("test.txt", "http://example.com/hoge")
  end

  def test_save_html_file
  end

  def test_get_entries
#    p @em.get_entries
  end
end

MTest::Unit.new.run