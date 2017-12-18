@registers = {}
('a'..'z').each do |letter|
    @registers[letter] = 0
end

@instructions = []

open('day18.txt').each_line do |line|
    @instructions << line.split(' ')
end

def is_letter(char)
    if char =~ /[A-Za-z]/
        return true
    end
    false
end

@sound = nil

def run_program
    current_line = 0
    loop do
        instruction = @instructions[current_line]
        case instruction[0]
        when 'snd'
            @sound = @registers[instruction[1]]
            current_line += 1
        when 'set'
            if is_letter(instruction[2])
                @registers[instruction[1]] = @registers[instruction[2]]
            else
                @registers[instruction[1]] = instruction[2].to_i
            end
            current_line += 1
        when 'add'
            if is_letter(instruction[2])
                @registers[instruction[1]] += @registers[instruction[2]]
            else
                @registers[instruction[1]] += instruction[2].to_i
            end
            current_line += 1
        when 'mul'
            current_line += 1
            if is_letter(instruction[2])
                @registers[instruction[1]] *= @registers[instruction[2]]
            else
                @registers[instruction[1]] *= instruction[2].to_i
            end
        when 'mod'
            if is_letter(instruction[2])
                @registers[instruction[1]] %= @registers[instruction[2]]
            else
                @registers[instruction[1]] %= instruction[2].to_i
            end
            current_line += 1
        when 'rcv'
            if @registers[instruction[1]] != 0
                p @sound
            end
            current_line += 1
        when 'jgz'
            if @registers[instruction[1]] > 0
                if is_letter(instruction[2])
                    current_line += @registers[instruction[2]]
                else
                    current_line += instruction[2].to_i    
                end
            else
                current_line += 1
            end
        end       
    end
    unless current_line.between?(0,41)
        return false
    end
end

run_program