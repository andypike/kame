require 'gosu'

class KameWindow < Gosu::Window  
  def initialize(lines, options)
    @width = options[:width]
    @height = options[:height]
    @background_colour = Gosu::Color.argb(KameColours::lookup[options[:paper]])
    @speed = options[:speed]
    @lines = lines
    @first_frame = Gosu::milliseconds
    
    super(@width, @height, false)
    self.caption = options[:title]
  end
  
  def draw_background
    draw_quad(0,      0,       @background_colour,
              @width, 0,       @background_colour,
              0,      @height, @background_colour,
              @width, @height, @background_colour,
              0)
  end
  
  def update
    @this_frame = Gosu::milliseconds
    @seconds_since_last_frame = (@this_frame - @first_frame) / 1000.0
  end
  
  def draw
    puts "Since Last In Draw: #{@seconds_since_last_frame}"
    puts "Lines: #{@lines.count}"
    self.draw_background
    puts "Since Last In Draw 2: #{@seconds_since_last_frame}"
    return if @lines.nil? || @lines.count == 0 || @seconds_since_last_frame.nil?
    
    max = (@seconds_since_last_frame * @speed).round
    if max > @lines.count - 1
      max = @lines.count - 1
    end
    
    0.upto(max).each do |i|
      line = @lines[i]
      line_colour = Gosu::Color.argb(line[:colour])
      draw_line(line[:from][:x], line[:from][:y], line_colour, line[:to][:x], line[:to][:y], line_colour, 1)
    end
  end
end