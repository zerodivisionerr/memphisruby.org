require 'helpers/meta_helpers'
require 'helpers/tag_helpers'
helpers MetaHelpers
helpers TagHelpers
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload
activate :blog do |blog|
  blog.prefix = "posts"
  blog.layout = "layouts/post"
  blog.permalink = ":title"
  blog.default_extension = ".md"
  blog.taglink = "tags/:tag"
  blog.tag_template = "posts/tags/tag.html"
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 3
end

activate :directory_indexes

page "/feed.xml", layout: false
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

ignore 'vendor/*'

# Add bower components dir to sprockets path
ready do
  sprockets.append_path File.join root, 'source/vendor'
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css, ignore: 'vendor/*'

  # Minify Javascript on build
  require 'uglifier'
  activate :minify_javascript, compressor: Uglifier.new(mangle: false)

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end