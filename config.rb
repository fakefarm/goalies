###
# Blog settings
###

# Time.zone = "UTC"

sprockets.append_path File.join root, 'bower_components'

helpers do
  def new_post
    if blog.articles.first.title.downcase == page_classes.split(' ')[0].downcase
      "<h1 class='fa fa-star'></h1>"
    end
  end

  def post_image
    unless current_article.nil?
      current_article.metadata[:page]['image']
    else
      current_page.metadata[:page]['image']
    end
  end

  def image_caption
    unless current_article.nil?
      caption = current_article.metadata[:page]['caption']
    else
      caption = current_page.metadata[:page]['caption']
    end
    "<div class='img-caption'>#{caption}</div>"
  end

  def post_title
    current_article.title
  end

  def post_snip
    current_article.metadata[:page]['snip']
  end
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :jasmine
activate :directory_indexes
activate :livereload

set :markdown_engine, :kramdown
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
