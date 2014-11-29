module ContextHelper

  def set_up_leaf_part(plot_code, tree_code, branch_code, leaf_code, leaf_part_code, batch_id = 1)
    batch = find_batch(batch_id)
    leaf = set_up_leaf(plot_code, tree_code, branch_code, leaf_code, batch_id)
    LeafPart.create! :code => leaf_part_code, :leaf => leaf, :batch => batch
  end

  def set_up_leaf(plot_code, tree_code, branch_code, leaf_code, batch_id = 1)
    batch = find_batch(batch_id)
    branch = set_up_branch(plot_code, tree_code, branch_code, batch_id)
    Leaf.create! :code => leaf_code, :branch => branch, :batch => batch
  end

  def set_up_branch(plot_code, tree_code, branch_code, batch_id = 1)
    batch = find_batch(batch_id)
    tree = set_up_tree(plot_code, tree_code, batch_id)
    Branch.create(:code => branch_code, :tree_id => tree.id, :batch => batch)
  end

  def set_up_tree(plot_code, tree_code, sub_plot_code = '1', batch_id = 1)
    batch = find_batch(batch_id)
    plot = set_up_plot(plot_code, batch_id)
    sub_plot = SubPlot.create!(:plot_id => plot.id, :sub_plot_code => sub_plot_code, :batch => batch)
    fp_species = FpSpecies.new
    Tree.create!(:tree_code => tree_code, :sub_plot => sub_plot, :fp_species => fp_species, :batch => batch)
  end

  def set_up_plot(plot_code, batch_id = 1)
    batch = find_batch(batch_id)
    Plot.create!(:plot_code => plot_code, :batch => batch)
  end

  def find_batch(batch_id)
    batch = Batch.find_or_create_by(id: batch_id)
  end

end
