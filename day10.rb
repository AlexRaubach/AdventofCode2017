@stepsize = [97,167,54,178,2,11,209,174,119,248,254,0,255,1,64,190]
@input = '97,167,54,178,2,11,209,174,119,248,254,0,255,1,64,190'
@position = 0
@skip_size = 0

@array = []

256.times do |i|
    @array << i
end

def hash_round(hash_array, steps)
    steps.each do |step|
        (step / 2).times do |y|
            hash_array[(@position + y) % hash_array.length],  hash_array[(@position + step - y -1) % hash_array.length] = hash_array[(@position + step - y -1) % hash_array.length], hash_array[(@position + y) % hash_array.length]
        end
        @position += step + @skip_size
        @skip_size += 1
    end
    return hash_array
end


@ascii = @input.unpack('U*') + [17, 31, 73, 47, 23]

64.times do 
    hash_round(@array, @ascii)
end

@dense_hash = []

16.times do |i|
    first_char = 16 * i
    output = 0
    16.times do |y|
        output = output ^ @array[first_char + y]
    end
    @dense_hash << output.to_s(16)
end


p @dense_hash.join


