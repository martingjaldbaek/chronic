module Chronic
  # A Span represents a range of time. Since this class extends
  # Range, you can use #begin and #end to get the beginning and
  # ending times of the span (they will be of class Time)
  class Span < Range
    # Set to true when Chronic has just assumed the found date instead of parsing it from the input
    # E.g. "3" is interpreted as "3 o clock today", but the date is just conjecture
    attr_accessor :date_is_guess

    def initialize(p1, p2, p3 = nil)
      super
      @date_is_guess = false
    end

    # Returns the width of this span in seconds
    def width
      (self.end - self.begin).to_i
    end

    # Add a number of seconds to this span, returning the
    # resulting Span
    def +(seconds)
      Span.new(self.begin + seconds, self.end + seconds)
    end

    # Subtract a number of seconds to this span, returning the
    # resulting Span
    def -(seconds)
      self + -seconds
    end

    # Prints this span in a nice fashion
    def to_s
      '(' << self.begin.to_s << '..' << self.end.to_s << ')'
    end

    alias :cover? :include? if RUBY_VERSION =~ /^1.8/

  end
end
