require "byebug"
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    @prc = prc
    @store = []
  end

  def count

  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    # raise "has no children" if parent_index * 2 + 1 >= len
    [parent_index * 2 + 1, parent_index * 2 + 2].reject { |n| n >= len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0 
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }    
    child1, child2 = BinaryMinHeap.child_indices(len, parent_idx)
    return array if !child1 && !child2
    return array if prc.call(array[parent_idx], array[child1]) <= 0 && 
                    prc.call(array[parent_idx], array[child2]) <= 0
    smaller = nil
    if child2 && prc.call(array[child2], array[child1]) <= 0
      smaller = child2
    else
      smaller = child1
    end
    array[smaller], array[parent_idx] = array[parent_idx], array[smaller]
    
    BinaryMinHeap.heapify_down(array, smaller, len, &prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b}
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    return array if prc.call(array[parent_idx], array[child_idx]) <= 0
    array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
    BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
  rescue StandardError => e
    if e.message == "root has no parent"
      return array
    end

  end
end
