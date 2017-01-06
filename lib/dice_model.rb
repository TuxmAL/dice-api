# dice_model.rb

class Dice

  def initialize(num = 1, faces = 6)
    raise RuntimeError, "No less than 1 dice can be created." if num < 1
    raise RuntimeError, "No less than 2 faces can be created." if faces < 2
    @faces = faces
    @num = num
  end

  def roll
    r = []
    @num.times { r << (1 + rand(@faces)) }
    r
  end

  def roll!(num, faces)
    r = []
    num.times { r << (1 + rand(faces)) }
    r
  end
  
  def to_s
    return "#{@num} di#{'c' if @num > 1}e, #{@faces} faces #{'each' if @num >1}"
  end

  def faces
    return @faces
  end

  def dice
    return @num
  end

end

#d = Dice.new 2, 12
#r = d.roll
#puts "#{r.join(', ')} = #{r.inject (:+)}"
