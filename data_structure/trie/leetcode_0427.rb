class Trie
  class Node
    attr_accessor :is_word, :nexts

    def initialize
      @is_word = false
      @nexts = {}
    end

    def is_word?
      is_word
    end
  end

  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      node.nexts[char] = Node.new if node.nexts[char] == nil
      node = node.nexts[char]
    end
    node.is_word = true
  end

  # return []
  def search(word)
    rtn = []
    node = @root
    for index in 0...word.length
      node = node.nexts[word[index]]
      break if node == nil
      rtn.push(index) if node.is_word?
    end
    return rtn
  end
end

def dfs(trie, word, length, index, cache)
  return 0 if index == length
  return cache[index] if cache[index] != nil

  rtn = -99999999
  trie.search(word[index, length]).reverse.each do |i|
    temp = 1 + dfs(trie, word, length, index + i + 1, cache)
    rtn = temp if temp > rtn
    break if rtn > 1
  end
  
  cache[index] = rtn
  return rtn
end

# @param {String[]} words
# @return {String[]}
def find_all_concatenated_words_in_a_dict(words)
  trie = Trie.new
  words.each { |word| trie.insert(word) }

  rtn = []
  words.each do |word|
    cache = Array.new
    rtn.push(word) if dfs(trie, word, word.length, 0, cache) > 1
  end

  return rtn
end

# words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
# puts find_all_concatenated_words_in_a_dict(words).inspect

words = ["a","b","ab","abc"]
puts find_all_concatenated_words_in_a_dict(words).inspect
