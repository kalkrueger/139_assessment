require 'bundler/setup'
require 'stamp'

class Cipher
  def self.rotate(str, num=13)
    num = consolidate_num(num)
    str.chars.map do |chr|
      if chr.match(/[A-Za-z]/)
        rotate_chr(chr, num)
      else
        chr
      end
    end.join
  end

  class << self
    private

    def consolidate_num(num)
      while num >= 26
        num -= 26
      end
      num
    end

    def rotate_chr(chr, num)
      if (chr.upcase.ord + num) <= 'Z'.ord
        (chr.ord + num).chr
      else
        (chr.ord - valid_num(chr, num)).chr
      end
    end

    def valid_num(chr, num)
      return num if (chr.upcase.ord - num) >= 'A'.ord
      26 - num
    end
  end
end
