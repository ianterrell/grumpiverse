class Admin::PagesController < Admin::BaseController
  inherit_resources
  defaults :resource_class => Page, :collection_name => 'pages', :instance_name => 'page'
end
