module Helpers
  
  def get_title(post)
    
    if current_page.data.title
      if get_basename() == "index" 
        return current_page.data.title
      else
        return "#{current_page.data.title} | #{title}"
      end
    end
    
    if post
      return "#{post.title} | #{title}"
    end
    
    return title
    
  end
  
  def get_social_description(post, via = true)
    if current_page.data.socialDescription
      return current_page.data.socialDescription
    end

    page_title = post ? post.title : current_page.data.title
  
    if meta('layout') == 'blog'
      if via
        return page_title + ' via @KomodoIDE'
      else
        return page_title
      end
    end

    return social_description
  end
  
  def get_basename()
    return File.basename(current_page.path, ".*" )
  end
  
  def meta(name)
    if current_page.data.has_key?(name)
      return current_page.data[name]
    else
      return false
    end
  end
  
  def get_list(ob, classAttr = "")
    imgPath = "#{site_url}/assets/images/"

    r = ['<ul class="' + (classAttr) + '">']
    ob.each do |value|
      if value.has_key?("link")
        if value["link"] == '/'
          value["link"] = site_url
        end
      else
        value["link"] = site_url + "/" + value["name"].downcase
      end
      
      value["link"] = value["link"].sub('{site.url}', site_url) 
      value["link"] = value["link"].gsub(/\s/,'-')

      if value.has_key?("sub")
        r.push '<li class="has-sub">'
      else
        r.push '<li>'
      end
      
      r.push "<a href='#{value["link"]}'"\
               " title='#{value["name"]}'"\
               " target='" + (value["target"] || "_self") + "'>"
      if value.has_key?("img")
        r.push "<img src='#{imgPath}#{value["img"]}' alt='#{value["name"]}'/>"
      end
      r.push "<span class='link-name'>#{value["name"]}</span>"
      if value.has_key?("icon")
        r.push "<i class='icon icon-#{value["icon"]}'></i>"
      end
      r.push "</a>"
      if value.has_key?("name_append")
        r.push value["name_append"]
      end
      if value.has_key?("sub")
        r.push get_list(value["sub"])
      end
      r.push "</li>"
    end

    r.push "</ul>"
    r = r.join("\n")
    return r
  end
  
  def summary(text, length = 250)
    text = text.gsub(/^#+.*\n/,'') # Strip markdown headers
    text = text.gsub(/\[(.*?)\](?:\[.*?\])?(?:\(.*?\))?/,'\1') # Strip markdown links
    text = text.gsub(%r{</?[^>]+?>}, '').gsub(/\n+/,' ') # Strip html and line endings
    text = text.gsub('Macro Monday - a new macro to dig into every Monday!','')
    text = text.split(".")
    if text.first().length > length
      return text.first()[0...250] + "..."
    end
    
    summary = text.shift + "."
    text.each() do |sentence|
      if summary.length + sentence.length > 250
        break
      end
      
      summary += sentence + "."
    end
    
    return summary
  end
  
  def yaml(path)
    require 'yaml'
    return YAML.load_file(File.dirname(__FILE__) + path)
  end
  
  def markitdown(source)
    return Tilt['markdown'].new { source }.render()
  end
  
  @@vimeo_cache = {}
  
  def vimeo_data(id, attr)
    unless (@@vimeo_cache.has_key?(id))
      api_url = "http://vimeo.com/api/v2/video/%s.json" % id
      @@vimeo_cache[id] = JSON.parse(open(api_url).read).first
    end
    
    data = @@vimeo_cache[id]
    return data.has_key?(attr) ? data[attr] : nil
  end
  
  def tags()
    tags = {}
    posts = data.blog.posts.sort_by { |k,v| v["date"] }.reverse
    posts.each() do |id,post|
      post.tags.each() do |tag|
        unless tags.has_key? tag
          tags[tag] = [];
        end
        
        tags[tag].push({
          "title" => post.title,
          "date" => post.date,
          "author" => post.author,
          "slug" => post.slug
        })
      end
    end
    
    return tags
  end
end