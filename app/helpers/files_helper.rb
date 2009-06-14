module FilesHelper
  def files_link options={}
    item = options[:path]

    if item !~ /^\// and not @path.blank? and not item.blank?
      item = File.join @path, item
    end

    name = options[:name]
    if not name
      name = File.basename(item)
    end

    if item.blank?
      link_to name, "/files"
    elsif options[:directory]
      link_to name, "/files/#{item}", :class => 'browsedir'
    else
      link_to name, "/files/#{item}"
    end
  end

  def file_icon mime
    if mime == "inode/directory"
      image_tag("directory.png")
    elsif mime =~ /^audio/
      image_tag("audio.png")
    elsif mime =~ /^video/
      image_tag("video.png")
    elsif mime =~ /^image/
      image_tag("image.png")
    elsif mime =~ /^text/
      image_tag("text.png")
    else
      image_tag("other.png")
    end
  end
end
