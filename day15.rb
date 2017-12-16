@a = 512
@b = 191

@a_values = []
@b_values = []

def next_round
    @a = (@a * 16807) % 2147483647
    @b = (@b * 48271) % 2147483647
end


@score = 0
@count = 0

until @count == 5000000
    next_round #I initially misunderstood the 2nd part, so my solution is really ineffecient 
    if @a % 4 == 0
        @a_values << @a
    end

    if @b % 8 == 0
        @b_values << @b
    end

    if @a_values.length > 0 && @b_values.length > 0
        if @a_values[0].to_s(2)[-16..-1] == @b_values[0].to_s(2)[-16..-1]
            @score += 1
        end
        @a_values.shift
        @b_values.shift
        @count += 1
    end
end

p @score