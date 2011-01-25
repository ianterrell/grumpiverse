class ComicRenderer < Svg::BaseRenderer
  def initialize(comic)
    @comic = comic
  end
  
  def xml(markup, options={})
    width = 960
    height = @comic.height.to_i
    
    svg_image :xml => markup, :height => height, :width => width do |svg|
      svg.font(:id => "AppleCasual", :"horiz-adv-x" => "500"){ |font| font << Svg::Fonts::AppleCasual }

      if @comic.left_character
        svg.g :transform => "translate(-80,139)" do
          svg << @comic.left_character.svg
        end
      end
      
      if @comic.right_character
        svg.g :transform => "translate(-80,139)" do
          svg << @comic.right_character.svg
        end
      end
      
      @comic.speech_bubbles.each do |speech_bubble|
        stringz = Svg::String.new speech_bubble.words, :font_size => 24
        svg.speech_bubble :cx => 450.0, :cy => 300.0, :rx => stringz.max_width/1.8, :ry => stringz.total_height/1.7, :px => 370.0, :py => 350.0
        svg.lines_of_text speech_bubble.words, :"font-family" => 'AppleCasual', :x => 450, :y => 300, :"alignment-baseline" => "central", :"text-anchor" => "middle", :"font-size" => '24px', :"fill-opacity" => 1
      end
    end
  end
end