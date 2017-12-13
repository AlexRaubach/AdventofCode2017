@input = []

open('input_d13.txt').each_line do |line|
    item = line.split(':')
    @input << [item[0].to_i, item[1].to_i]
end

def check_overlap(delay)
    score = 0

    @input.each do |subarray|
        if (subarray[0] + delay ) % (subarray[1]*2 -2) == 0
            # score += subarray[0] * subarray[1] 
            return 1 # For part 2 we want to return a failure as soon as possible 
        end
    end
    return score
end

10000000.times do |i|
    if check_overlap(i) == 0
        p i
    end
end