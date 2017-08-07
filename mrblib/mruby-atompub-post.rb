def __main__(argv)
  opt = OptionParser.new
  dry_run = false
  preview_mode = false
  show_version = false
  config_file = nil
  opt.on('-n') {|v| dry_run = v}
  opt.on('-p') {|v| preview_mode = v}
  opt.on('-v') {|v| show_version = v}
  opt.on('-f CONFIG_FILE') {|v| config_file = v}

  opt.parse!(ARGV)

  if show_version == true
    puts "v#{AtomPubPost::VERSION}"
  else
    # ToDo check arguments!!!
    blog = AtomPubPost::Blog.new(config_file)
    if preview_mode == true
      preview_filename = blog.preview_entry(ARGV[1], dry_run)
      puts preview_filename
    else
      blog.post_entry(ARGV[1], dry_run)
    end
  end
end
