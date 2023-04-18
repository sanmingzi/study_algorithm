# lowest common ancestor
class LCA
  def initialize(root, size)
    @root = root
    @length = Math.log(size, 2).to_i + 1
    @ancestors, @tin, @tout = Hash.new, Hash.new, Hash.new
    @time = 0
    generate_ancestors(root, root)
  end

  def query(u, v)
    return u if is_ancestor?(u, v)
    return v if is_ancestor?(v, u)

    (@length - 1).downto(0) do |i|
      unless is_ancestor?(@ancestors[u][i], v)
        u = @ancestors[u][i]
      end
    end
    return @ancestors[u][0]
  end

  private

  def generate_ancestors(fat, cur)
    @tin[cur] = (@time += 1)

    @ancestors[cur] ||= Array.new(@length, @root)
    cur_ancestors = @ancestors[cur]
    cur_ancestors[0] = fat
    for i in 1...@length
      cur_ancestors[i] = @ancestors[cur_ancestors[i - 1]][i - 1]
      break if cur_ancestors[i] == @root
    end

    [cur.left, cur.right].each { |child| generate_ancestors(cur, child) if child }

    @tout[cur] = (@time += 1)
  end

  def is_ancestor?(u, v)
    @tin[u] <= @tin[v] && @tout[u] >= @tout[v]
  end
end
