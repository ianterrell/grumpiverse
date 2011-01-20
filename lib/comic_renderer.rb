class ComicRenderer < Svg::BaseRenderer
  def xml(markup, options={})
    width = 600#options[:width] || 100
    height = 600#options[:height] || 100
    
    svg_image :xml => markup, :height => height, :width => width do |svg|
      svg.font(:id => "AppleCasual", :"horiz-adv-x" => "500"){ |font| font << Svg::Fonts::AppleCasual }
      svg.g :transform => "translate(-80,139)" do
        svg << Character.last.svg
      end
      
      svg.text 'some more copy', :"font-family" => 'AppleCasual', :x => 300, :y => 300, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => '24px', :"fill-opacity" => 1
    end
  end
end