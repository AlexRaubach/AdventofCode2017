

side_length = 1

desired_number = 312051

while side_length ** 2 < desired_number
    side_length += 1
end

p side_length
p side_length ** 2

desired_x = side_length  - desired_number % side_length 

desired_y = side_length 

center_coord = side_length / 2 + 1

moves = (desired_x - center_coord).abs + (desired_y - center_coord).abs
p moves
#off by 1 when calculating the number of moves.