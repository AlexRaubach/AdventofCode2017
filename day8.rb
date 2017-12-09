

@hash = {}
@max = 0

def get_hash_value(x)
    return 0 if @hash[x] == nil
    return @hash[x]
end

def set_hash_value(key, direction, delta)
    x = get_hash_value(key)

    if direction == 'dec'
        @hash[key] = x - delta        
    else
        @hash[key] = x + delta
    end
    if @hash[key] > @max
        @max =  @hash[key]
    end
end

def case_check(key, operator, value)
    x = get_hash_value(key)

    if operator == '>'
        return x > value
    elsif operator == '>='
        return x >= value
    elsif operator == '=='
        return x == value
    elsif operator == '<'
        return x < value
    elsif operator == '<='
        return x <= value
    elsif operator == '!='
        return x != value
    end
end


open('input_d8.txt').each_line do |line|
    x = line.chomp.split(' ')
    if case_check(x[4], x[5], x[6].to_i)
        set_hash_value(x[0], x[1], x[2].to_i)
    end
end

p @hash.max_by{|k,v| v}
p @max