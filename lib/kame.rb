require 'kame/kame_window'
require 'kame/kame_colours'

class Kame
  def initialize(options = {}, &block)
    @lines = []
    @state = {
      :pen_down => false,
      :x => 0,
      :y => 0,
      :rotation => 0,
      :line_colour => KameColours::lookup[:black]
    }
  
    opts = {
      :width => 640,
      :height => 480,
      :paper => :white,
      :title => 'Kame',
      :speed => 10
    }.merge(options)
    
    instance_eval(&block)
    
    KameWindow.new(@lines, opts).show
  end
  
  def pen_up
    @state[:pen_down] = false
  end
  
  def pen_down
    @state[:pen_down] = true
  end
  
  def pen_down?
    @state[:pen_down]
  end 
  
  def turn_left(degrees)
    @state[:rotation] -= degrees
  end
  
  def turn_right(degrees)
    @state[:rotation] += degrees
  end
  
  def colour(colour)
    @state[:line_colour] = KameColours::lookup[colour]
  end
  
  def forward(distance)
    theta = @state[:rotation].degrees_to_radians
    x = @state[:x] + distance * Math::cos(theta)
    y = @state[:y] + distance * Math::sin(theta)
    
    if pen_down?
      @lines << { 
        :colour => @state[:line_colour], 
        :from => { :x => @state[:x], :y => @state[:y] },
        :to => { :x => x, :y => y } 
      }
    end
    
    @state[:x] = x
    @state[:y] = y
  end
  
  def backward(distance)
    self.forward(-distance)
  end
  
  def method_missing(method_name, *args)
    puts "Sorry, but I don't know what '#{method_name}' means?"
  end
end

