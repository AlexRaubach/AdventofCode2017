
@output = ''

def remove_garbage(string)
    clean_string = ''
    garbage_count = 0
    garbage = false
    string.each_char do |char|
        if char != '<' && garbage == false
            clean_string << char
        elsif garbage == true
            if char == '>'
                garbage = false
            else
                garbage_count += 1
            end
        elsif char == '<'
            garbage = true
        end
    end
    puts 'garbage = ' + garbage_count.to_s
    return clean_string
end

def score_array(string)
    score = 0
    depth = 1
    string.each_char do |char|
        if char == '{'
            depth += 1
    elsif char == '}'
            depth -= 1
            score += depth

        end
    end
    return score
end

def remove_!(string)
    delete = false   
    clean_string = ''
    string.each_char do |char|
        if char != '!' && delete == false
            clean_string << char 
        elsif delete != false
            delete = false
        elsif char == '!'
            delete = true
        end
    end
    return clean_string
end

open('input_d9.txt').each_line do |line|
    delete = false    
    line.each_char do |char|
        if char != '!' && delete == false
            @output << char 
        elsif delete != false
            delete = false
        elsif char == '!'
            delete = true
        end
    end

    array_string = remove_garbage(@output).tr(',', '')
    p score_array(array_string)
    #eval('p '+array_string.to_s)
end

