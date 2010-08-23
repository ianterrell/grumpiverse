class ArticlesController < ApplicationController
  layout 'content'
  caches_page :show
  inherit_resources
end
