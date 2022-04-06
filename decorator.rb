class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class BaseDecorator < Nameable
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @name.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @name.correct_name[0..9] if @name.correct_name.length > 10

    @name.correct_name
  end
end
