class TestMrubyAtompubPostPlugin < MTest::Unit::TestCase
  def setup
    @conf = AtomPubPost::Config.new(ENV['HOME'] + "/.ldblogwriter.conf")
    @plugin = AtomPubPost::Plugin.new(@conf)
  end
  
  def test_eval_src
#    p @plugin.eval_src("hoge")
  end

  def test_load_plugins
  end

  def test_load_plugin
  end

  def test_eval_post
#    @plugin.eval_src('hoge("aa","bb")')
#    @plugin.eval_post(LDBlogWriter::BlogEntry.new(@conf, "test"))
  end
end

MTest::Unit.new.run