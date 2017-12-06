@input = [2,8,8,5,4,2,3,1,5,5,1,2,15,13,5,14]

@hash = {}

def checkhash
    if @hash[@input*","] != nil && 
        if @hash[@input*","] == 1 
            @hash[@input*","] = 2
        else
            return true
        end 
    else
        @hash[@input*","] = 1
        return false
    end
end

def redistribute(i)
    index = i+1
    count = @input[i]
    @input[i] = 0
    while count > 0
        @input[index % @input.length] +=1
        count -=1
        index +=1
    end
end

def find_max
    max = 0
    index = 0

    @input.each.with_index do |num, i|
        if num > max
            max = num
            index = i
        end
    end
    return index
end

count = 0 
until checkhash
    redistribute(find_max)
    count +=1    
end
p @hash.length
p count
p count - @hash.length