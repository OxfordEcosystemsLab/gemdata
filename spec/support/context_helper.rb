module ContextHelper

  def set_up_leaf_part(plot_code, tree_code, branch_code, leaf_code, leaf_part_code, batch_id = 1)
    batch = find_batch(batch_id)
    leaf = set_up_leaf(plot_code, tree_code, branch_code, leaf_code, batch_id)
    LeafPart.create! :code => leaf_part_code, :leaf => leaf, :batch => batch, :evaluators => 'dummy', :original_code => 'dummy', :fresh_mass => nil, :dry_mass => nil, :thickness => nil, :petiole_width => nil
  end

  def set_up_leaf(plot_code, tree_code, branch_code, leaf_code, batch_id = 1)
    batch = find_batch(batch_id)
    branch = set_up_branch(plot_code, tree_code, branch_code, batch_id)
    Leaf.create! :code => leaf_code, :branch => branch, :batch => batch
  end

  def set_up_branch(plot_code, tree_code, branch_code, batch_id = 1)
    batch = find_batch(batch_id)
    tree = set_up_tree(plot_code, tree_code, nil, batch_id)
    Branch.create(:code => branch_code, :tree_id => tree.id, :batch => batch)
  end

  def set_up_tree(plot_code, tree_code, sub_plot_code = nil, batch_id = 1)
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

  def set_up_litterfall_trap(plot_code, trap_num, trap_size, batch_id = 1)
    batch = find_batch(batch_id)
    plot = set_up_plot(plot_code, batch_id)
    LitterfallTrap.create!(plot: plot, litterfall_trap_num: trap_num, litterfall_trap_size_m2: trap_size, batch: batch)
  end

  def set_up_ingrowth_core(plot_code, core_num, batch_id = 1)
    batch = find_batch(batch_id)
    plot = set_up_plot(plot_code, batch_id)
    IngrowthCore.create!(plot: plot, ingrowth_core_num: core_num, batch: batch)
  end

  def set_up_cwd_sub_transect(plot_code, transect_num, sub_transect_num, sub_transect_area, batch_id = 1)
    batch = find_batch(batch_id)
    plot = set_up_plot(plot_code, batch_id)
    cwd_transect = CwdTransect.create!(plot: plot, transect_num: transect_num, batch: batch)
    CwdSubTransect.create!(cwd_transect: cwd_transect, sub_transect_num: sub_transect_num, sub_transect_area_m2: sub_transect_area, batch: batch)
  end

  def set_up_egm_respiration_collar(plot_code, collar_num = nil, batch_id = 1)
    batch = find_batch(batch_id)
    plot = set_up_plot(plot_code, batch_id)
    EgmRespirationCollar.create!(plot: plot, collar_num: collar_num, batch: batch)
  end

  def find_batch(batch_id)
    batch = Batch.find_or_create_by(id: batch_id)
  end

end
