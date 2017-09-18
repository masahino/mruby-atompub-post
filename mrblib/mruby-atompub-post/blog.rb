module AtomPubPost
  class Blog
    ConfigFile = ENV['HOME'] + "/.ldblogwriter.conf"

    def initialize(config_file = nil)
      if config_file == nil
        @conf = Config.new(ConfigFile)
      else
        @conf = Config.new(config_file)
      end
      @service = ServiceBuilder::get_service(@conf)
      check_config
      if $DEBUG
        puts "blog title:" + @conf.blog_title
      end
      @plugin = Plugin.new(@conf)
      @entry_manager = AtomPubPost::EntryManager.new(@conf.edit_uri_file)
    end

    def print_usage
      
    end

    def create_entry(filename, dry_run = true)
      if filename == nil
        print_usage
        exit
      end
      # load
      src_text = ""
      File.open(filename, "r") do |file|
        src_text = file.read
#        src_text = Kconv::toutf8(src_text)
      end
      entry = Parser.new(@conf, @plugin, @service).get_entry(src_text)
    end

    def post_entry(filename, dry_run = true)
      puts "post entry"
      puts "filename : #{filename}"
      @blog_filename = filename
      entry = create_entry(filename, dry_run)

      if @entry_manager.has_entry?(filename) == false
        # post
        if dry_run == false
          edit_uri = @service.post_entry(entry.content, entry.title, entry.category)
          if $DEBUG
            puts "editURI : #{edit_uri}"
          end
          if edit_uri != false
            @entry_manager.save_edit_uri(filename, edit_uri)
          end
        end
      else
        # edit
        if dry_run == false
          edit_uri = @entry_manager.get_edit_uri(filename)
          @service.edit_entry(edit_uri, entry.content, entry.title, entry.category)
        end
      end
      if dry_run == false
        entry.alternate_uri = @service.get_entry(edit_uri).uri
      end

      if @conf.auto_trackback == true
        send_trackback(entry)
      end

      # post process
      @plugin.eval_post(entry)
    end

    def send_trackback(entry)
      entry.trackback_url_array.uniq!
      entry.trackback_url_array.each do |trackback_url|
        print "Send trackback to #{trackback_url} ? (y/n) "
        ret = $stdin.gets.chomp
        pp ret
        if ret == "y" or ret == "Y"
          TrackBack.send(trackback_url, @conf.blog_title, entry.title,
                         "", entry.alternate_uri)
        end
      end
    end

    # ファイル名と同じ名前で拡張子が、"jpg"のファイルがあったら
    # アップロードしてエントリーの先頭に入れる。
    def check_image_file(filename, src_text)
      ext_list = ['.jpg', '.png']
      ext_list.each do |ext|
        img_filename = File::basename(filename)[0..-5] + ext
        img_filename = File::dirname(filename) + "/" + img_filename
        if $DEBUG
          puts img_filename
        end
        if File::exist?(img_filename) == true
          src_text = "#img(#{img_filename})\n\n" + src_text
          break
        end
      end
      if $DEBUG
        puts src_text
      end
      return src_text
    end

    def check_config_user_and_pass
      if @conf.username == nil
        print "Username: "
        @conf.username = $stdin.gets.chomp
      end
      if @conf.password == nil
        print "Password: "
        @conf.password = $stdin.gets.chomp
      end
    end

    def check_config
      if $DEBUG
        puts "check username and password"
      end
      check_config_user_and_pass
      if $DEBUG
        puts "check Atom APIs"
      end
    end
  end
end