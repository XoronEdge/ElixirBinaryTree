defmodule Tree do
  alias AddNode
  alias TreeNode

  def create_tree do
    %TreeNode{data: 1}
  end

  def add_new_node(%TreeNode{} = user, data), do: AddNode.add(user, data)
end
