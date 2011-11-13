require 'gosu'

class KameWindow < Gosu::Window  
  def initialize(lines, options)
    @width = options[:width]
    @height = options[:height]
    @background_colour = Gosu::Color.argb(KameColours::lookup[options[:paper]])
    @speed = options[:speed]
    @grid = options[:grid]
    @grid_size = options[:grid_size]
    @grid_colour = Gosu::Color.argb(KameColours::lookup[options[:grid_colour]])
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
  
  def grid
    @grid_font ||= Gosu::Font.new(self, "Arial", 10)
    @grid_size.times do |i|
      c = (@width / @grid_size) * (i + 1)
      r = (@height / @grid_size) * (i + 1)

      draw_line(0, r, @grid_colour, @width, r, @grid_colour, 1)
      @grid_font.draw(r.to_s, 2, r - 11, 1, 1, 1, @grid_colour)

      draw_line(c, 0, @grid_colour, c, @height, @grid_colour, 1)
      c_width = @grid_font.text_width(c.to_s)
      @grid_font.draw(c.to_s, c - c_width - 2, @height - 13, 1, 1, 1, @grid_colour)
    end
  end
  
  def update
    @this_frame = Gosu::milliseconds
    @seconds_since_last_frame = (@this_frame - @first_frame) / 1000.0
  end
  
  def draw
    self.draw_background
    self.grid if @grid
    return if @lines.nil? || @lines.count == 0 || @seconds_since_last_frame.nil?
    
    max = (@seconds_since_last_frame * @speed).round
    if max > @lines.count - 1
      max = @lines.count - 1
    end
    
    0.upto(max).each do |i|
      line = @lines[i]
      line_colour = Gosu::Color.argb(line[:colour])
      draw_line(line[:from][:x], line[:from][:y], line_colour, line[:to][:x], line[:to][:y], line_colour, 10)
    end
  end
end