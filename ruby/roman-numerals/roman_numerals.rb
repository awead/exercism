class Fixnum
  def to_roman
    return if self > 3000 || self < 1
    [
      digit_thousand,
      digit(digits[-3], 'C', 'D', 'M'),
      digit(digits[-2], 'X', 'L', 'C'),
      digit(digits[-1])
    ].join
  end

  private

    def digits
      to_s.split('').map(&:to_i)
    end

    def digit_thousand
      return unless digits[-4]
      'M' * digits[-4]
    end

    def digit(place, first = 'I', fifth = 'V', tenth = 'X')
      return unless place
      case
        when place < 4 then first * place
        when place == 4 then first + fifth
        when place == 5 then fifth
        when place > 5 && place < 9 then fifth + (first * (place - 5))
        when place == 9 then first + tenth
      end
    end
end

module BookKeeping
  VERSION = 2
end
