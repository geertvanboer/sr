# Author: Geert van Boer
# Email: author.join('.') + '@gmail.com'
# Undecided License

module SimplerRoutes

# Once routes have been defined, the set of keys used is closed. We take
# advantage of this to store keys in arrays instead of hashes. Each key is
# assigned an index within the array.
#
# Key sets encapsulate the creation of key array, and provide methods to convert
# a hash of symbols to an ordered array.
class KeySet
  # The set of contained keys
  attr_reader :keys  #=> [Symbol] sorted by string value
  # @key_to_index => {Symbol => Integer}
  
  def initialize(keys)
    @keys = keys.sort_by { |k| k.to_s }
    @keys_to_index = []
    @keys.each_with_index { |k, i| @keys_to_index[k] = i }
  end

  def index_for(key)
    @keys_to_index[key]
  end
  def key_at(index)
    keys[index]
  end

  def size
    keys.size
  end

  def hash_to_array(kv_hash, v_array = Array.new(nil, keys.size))
    kv_hash.each do |k, v|
      v_array[index_for(k)] = v
    end
    v_array
  end
end

end
