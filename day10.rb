@stepsize = [97,167,54,178,2,11,209,174,119,248,254,0,255,1,64,190]
@position = 0
@skip_size = 0

@array = []

256.times do |i|
    @array << i
end


@stepsize.each do |step|

    (step / 2).times do |y|
        @array[(@position + y) % @array.length],  @array[(@position + step - y -1) % @array.length] = @array[(@position + step - y -1) % @array.length], @array[(@position + y) % @array.length]
    end
    @position += step + @skip_size
    @skip_size += 1
end

p @array
p @array[0] * @array[1]