require 'builder'

module Svg
  class BaseRenderer
    include Helper
    
    def render(options={})
      buffer = ""
      markup = Builder::XmlMarkup.new(:target => buffer)
      xml(markup, options)
      return buffer.html_safe
    end
  end
end