class ComicRenderer < Svg::BaseRenderer
  def xml(markup, options={})
    width = 600#options[:width] || 100
    height = 600#options[:height] || 100
    
    svg_image :xml => markup, :height => height, :width => width do |svg|
      svg.font(:id => "AppleCasual", :"horiz-adv-x" => "500"){ |font| font << Svg::Fonts::AppleCasual }
      svg.g :transform => "translate(-80,139)" do
        svg << Character.first.svg
      end
      
      # svg.ellipse :cx => 450, :cy => 300, :rx => 100, :ry => 40, :fill => "#FFFFFF", :stroke => "#000000", :"stroke-width" => 3
      # svg.polyline :fill => "#FFFFFF", :points => "420,300 370,350 480,300"
      svg.speech_bubble :cx => 450.0, :cy => 300.0, :rx => 100.0, :ry => 45.0, :px => 370.0, :py => 350.0
      # svg.text 'some more copy', :"font-family" => 'AppleCasual', :x => 450, :y => 300, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => '24px', :"fill-opacity" => 1
      svg.lines_of_text 'This is not|a funny joke,|asshole!', :"font-family" => 'AppleCasual', :x => 450, :y => 300, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => '24px', :"fill-opacity" => 1
    end
  end
end