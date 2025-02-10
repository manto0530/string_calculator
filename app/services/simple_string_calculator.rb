class SimpleStringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..]
      numbers = parts[1]
    end

    numbers = numbers.gsub("\n", delimiter)
    number_list = numbers.split(delimiter).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    number_list.sum
  end
end