module Golomb
  class Encoder

    def initialize(divisor, data)
      @divisor = divisor
      @data = data
      @encoded_data = []
    end

    attr_accessor :divisor, :data, :encoded_data

    def exec
      @data.each_byte do |byte|
        encode(byte)
      end
    end

    def encode(symbol)
      quotient = (symbol / @divisor).to_i
      remainder = symbol % @divisor
      # quotient_code = "#{"1" * quotient}#{0}"
      quotient_code = ("1" * quotient) << "0"

      # checks if the divisor is power of 2 (Rice coding)
      if @divisor.to_s(2).scan(/1/).size == 1
        remainder_code = remainder.to_s(2)
      else
        b = Math.log2(@divisor).ceil

        if remainder < (2 ** b) - @divisor
          # remainder_code = "#{"0" * (b - 1 - remainder.to_s(2).size)}#{remainder.to_s(2)}"
          remainder_code = "0" * (b - 1 - remainder.to_s(2).size) << remainder.to_s(2)
        else
          remainder_code = (remainder + (2 ** b) - @divisor).to_i.to_s(2)
        end
      end

      @encoded_data << (quotient_code << remainder_code)
    end

    def data_to_hex
      @data.unpack('U'*@data.length).collect {|x| "0x#{x.to_s(16)}" }.join(" ")
    end

    def result_to_hex
      @encoded_data.collect {|x| "0x%02x" % x.to_i(2) }.join(" ")
    end

    def symbol_table
      @encoded_data.collect.with_index {|x, i| ["#{@data[i]} (#{@data[i].ord})", x]}
    end

  end
end
