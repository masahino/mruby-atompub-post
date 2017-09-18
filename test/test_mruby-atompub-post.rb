class TestMrubyAtompubPost < MTest::Unit::TestCase
  def setup

  end

  def test_get_blog_info
    AtomPubPost::Blog.new
  end

  def test_check_img_file
    blog = AtomPubPost::Blog.new
    dir_name = File.dirname(__FILE__)
    test_jpg = dir_name + "/test.jpg"
    test_txt = dir_name + "/test.txt"
    nofile_txt = dir_name + "/nofile.txt"
    test2_png = dir_name + "/test2.png"
    test2_txt = dir_name + "/test2.txt"
    assert_equal("#img(#{test_jpg})\n\nhogehoge",
                 blog.check_image_file(test_txt, "hogehoge"))
    assert_equal("hogehoge", blog.check_image_file(nofile_txt, "hogehoge"))
    assert_equal("#img(#{test2_png})\n\nhogehoge",
                 blog.check_image_file(test2_txt, "hogehoge"))
  end

  def test_main
#    assert_nil __main__([])
  end
end

MTest::Unit.new.run
