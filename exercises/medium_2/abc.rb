BLOCKS = [['b', 'o'], ['g', 't'], ['v', 'i'], ['x', 'k'], ['r', 'e'], ['l', 'y'], 
          ['d', 'q'], ['f', 's'], ['z', 'm'], ['c', 'p'], ['j', 'w'], ['n', 'a'], ['h', 'u']]

def block_word?(word)
  BLOCKS.each do |block|
    # return false if (word.downcase.include?(block[0]) && word.downcase.include?(block[1]))
    return false if word.downcase.count(block.join) > 1
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('any') == false
p block_word?('roar') == false

