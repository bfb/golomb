module Golomb
  class Decoder
    def initialize(divisor, data)
      @divisor = divisor
      @data = data
      @decoded_data = []
    end

    attr_accessor :divisor, :data, :decoded_data

    def exec
      @data.split(" ").each do |n|
        decode(n)
      end
    end

    def decode(n)
      b = Math.log2(@divisor).ceil
      binary = n.to_i(16).to_s(2)
      quotient_code, remainder_code = binary.sub("0", "-").split("-")
      quotient = quotient_code.size
      remainder = (remainder_code == 3 ? "0#{remainder_code}" : remainder_code).to_i(2)

      if remainder >= (2 ** b) - @divisor
        remainder = -(2 ** b) + @divisor + remainder
      end

      symbol = (quotient * @divisor + remainder).chr
      @decoded_data << symbol
    end
  end
end

