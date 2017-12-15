@a = 512
@b = 191

def next_round
    @a = (@a * 16807) % 2147483647
    @b = (@b * 48271) % 2147483647
end


@score = 0

40000000.times do
    next_round
    if @a.to_s(2)[-16..-1] == @b.to_s(2)[-16..-1]
        @score += 1
    end
end

p @score