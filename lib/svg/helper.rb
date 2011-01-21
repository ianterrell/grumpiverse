module Svg
  module Helper
    def svg_image(options = {}, &block)
      xml = options.delete(:xml) || eval("xml", block.binding)
    
      xml.instruct! :xml, :version => "1.0", :standalone => "no"
      xml.declare! :DOCTYPE, :svg, :PUBLIC, "-//W3C//DTD SVG 1.1//EN", "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
    
      options[:height] ||= 100
      options[:width] ||= 100
    
      svg_opts = { :width => options[:width], :height => options[:height], :version => "1.1", :xmlns => "http://www.w3.org/2000/svg", "xmlns:xlink" => "http://www.w3.org/1999/xlink" }
      xml.svg(svg_opts) do
        yield SvgImageBuilder.new(xml, self, options)
      end
    end

    class SvgBuilder
      def initialize(xml)
        @xml = xml
      end

    private
      def method_missing(method, *arguments, &block)
        @xml.__send__(method, *arguments, &block)
      end
    end

    class SvgImageBuilder < SvgBuilder
      def initialize(xml, view, options = {})
        @xml, @view, @options = xml, view, options
      end

      def arrow(from, to, options={})
        angleish = options.delete(:angleish) || 0.667
        curve_point = options.delete(:curve_to) || from
        head_length = options.delete(:head_length) || (to - from).r / 10

        line = to - from
        vector = (curve_point-to).normalize
        perp1 = Vector[-vector[1],vector[0]]*angleish
        perp2 = Vector[vector[1],-vector[0]]*angleish

        half1 = (vector + perp1).normalize
        half2 = (vector + perp2).normalize

        arrow1 = to + half1 * head_length;
        arrow2 = to + half2 * head_length;

        @xml.path options.merge(:d => "M#{from[0]} #{from[1]} S#{curve_point[0]} #{curve_point[1]} #{to[0]} #{to[1]}")
      
        # One line, pointy end
        @xml.path options.merge(:d => "M#{arrow1[0]} #{arrow1[1]} S#{to[0]} #{to[1]} #{to[0]} #{to[1]} S#{arrow2[0]} #{arrow2[1]} #{arrow2[0]} #{arrow2[1]}")
      
        # Two lines, disjointed end
        # @xml.path options.merge(:d => "M#{to[0]} #{to[1]} S#{arrow1[0]} #{arrow1[1]} #{arrow1[0]} #{arrow1[1]}")
        # @xml.path options.merge(:d => "M#{to[0]} #{to[1]} S#{arrow2[0]} #{arrow2[1]} #{arrow2[0]} #{arrow2[1]}")
      end

      def preview(text="PREVIEW")
        font_size = @options[:height] / 5
        @xml.text text, :x => @options[:height]/2, :y => font_size, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => font_size, :"fill-opacity" => 0.1
        @xml.text text, :x => @options[:height]/2, :y => @options[:height]/2, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => font_size, :"fill-opacity" => 0.1
        @xml.text text, :x => @options[:height]/2, :y => @options[:height]-font_size, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => font_size, :"fill-opacity" => 0.1
      end
    
      def lines_of_text(text, options={})
        x = options.delete :x
        y = options.delete :y
        unless text.is_a? ::Svg::String
          text = ::Svg::String.new text, :font_size => (options[:"font-size"] || options["font-size"] || options[:font_size] || "10px").gsub("px","").to_i
        end
        text.lines.each_with_index do |line, index|
          @xml.text line, options.merge(:x => x, :y => text.vertical_center_for_line(index, :offset => y))
        end
      end

      # def font(name, options = {})
      #   @xml.font(:id => "HelveticaRoundedLTStd-Bd", :"horiz-adv-x" => "611"){ |font| font << render(:partial => "/fonts/helvetica_rounded_bold") }
      # end
      
      def speech_bubble(options={})
        cx, cy, rx, ry, px, py = options[:cx], options[:cy], options[:rx], options[:ry], options[:px], options[:py]

        # We have an ellipse
        @xml.ellipse :cx => cx, :cy => cy, :rx => rx, :ry => ry, :fill => "#FFFFFF", :stroke => "#000000", :"stroke-width" => 3
        
        # Take two lines given described by three points, the tip of the speech bubble point as P, 
        # making two lines against each of two points A and B on the interior that we guess
        
        ax = cx - rx/3
        ay = cy
        bx = cx + rx/3
        by = cy
        
        # And some brute force calculations to get a pixel or two inside each line
        m = slope_for(px,py,ax,ay)
        i = intersection_for(ax,ay,m)
        a = intersection_of_ellipse_and_line(px,ax,cx,cy,rx,ry,m,i)
        
        m = slope_for(px,py,bx,by)
        i = intersection_for(bx,by,m)
        b = intersection_of_ellipse_and_line(px,bx,cx,cy,rx,ry,m,i)

        @xml.polyline :fill => "#FFFFFF", :points => "#{a[0]},#{a[1]} #{px},#{py} #{b[0]},#{b[1]}", :stroke => "#000000", :"stroke-width" => 3
      end
      
      def slope_for(x1,y1,x2,y2)
        (y2-y1)/(x2-x1)
      end
      
      def intersection_for(x,y,m)
        y - m * x
      end
      
      def intersection_of_ellipse_and_line(x_initial,x_final,cx,cy,rx,ry,m,b)
        x = x_initial
        y = line_equation(x,m,b)
        result = ellipse_equation(x,y,cx,cy,rx,ry)
        while (x < x_final && result > 1.0)
          y = line_equation(x,m,b)
          result = ellipse_equation(x,y,cx,cy,rx,ry)
          x += 1
        end
        
        x += 0.2 # fudge it! best fudge value might depend on size
        y = line_equation(x,m,b)
        [x,y]
      end
      
      def line_equation(x,m,b)
        m*x + b
      end
      
      def ellipse_equation(x,y,cx,cy,rx,ry)
        (x - cx)**2/rx**2 + (y - cy)**2/ry**2
      end
    end

  end
end