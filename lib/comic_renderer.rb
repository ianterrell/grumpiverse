class ComicRenderer < Svg::BaseRenderer
  def xml(markup, options={})
    width = 600#options[:width] || 100
    height = 600#options[:height] || 100
    
    svg_image :xml => markup, :height => height, :width => width do |svg|
      svg.font(:id => "AppleCasual", :"horiz-adv-x" => "500"){ |font| font << Svg::Fonts::AppleCasual }
      svg.g :transform => "translate(-80,139)" do
        svg << Character.last.svg
      end
      
      svg.ellipse :cx => 450, :cy => 300, :rx => 100, :ry => 40, :fill => "#FFFFFF", :stroke => "#000000", :"stroke-width" => 3
      svg.polyline :fill => "#FFFFFF", :points => "420,300 370,350 480,300", :stroke => "#000000"

      svg.text 'some more copy', :"font-family" => 'AppleCasual', :x => 450, :y => 300, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => '24px', :"fill-opacity" => 1
    end
  end
end