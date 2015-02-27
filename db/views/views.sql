DROP VIEW basic_leaf_part_view AS
DROP VIEW basic_leaf_view AS
DROP VIEW basic_branch_view;
DROP VIEW basic_tree_view;

-- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- ---

CREATE VIEW basic_tree_view AS
SELECT
  trees.id AS tree_id,
  trees.tree_code AS tree_code,
  trees.fp_id AS fp_tree_id,
  fp_species.name AS fp_species_name,
  fp_species.fp_id AS fp_species_id,
  fp_genera.name AS fp_genus_name,
  fp_genera.fp_id AS fp_genus_id,
  fp_families.name AS fp_family_name,
  fp_families.apg_id AS fp_family_apg_id,
  sub_plots.sub_plot_code AS sub_plot_code,
  plots.plot_code AS plot_code,
  csp_sub_query.csp_site AS csp_site,
  csp_sub_query.csp_tree_code AS csp_tree_code,
  csp_sub_query.csp_species AS csp_species,
  csp_sub_query.csp_family AS csp_family,
  csp_sub_query.csp_full_name AS csp_full_name,
  csp_sub_query.csp_taxon_info AS csp_taxon_info  
FROM
  trees
  LEFT OUTER JOIN fp_species ON (fp_species.id = trees.fp_species_id)
  LEFT OUTER JOIN fp_genera ON (fp_genera.id = fp_species.fp_genus_id)
  LEFT OUTER JOIN fp_families ON (fp_families.id = fp_family_id)
  INNER JOIN sub_plots on (sub_plots.id = trees.sub_plot_id)
  INNER JOIN plots on (plots.id = sub_plots.plot_id)
  LEFT OUTER JOIN (
    SELECT DISTINCT
      csp_translations.site AS csp_site,
      csp_translations.tree_code AS csp_tree_code,
      csp_translations.species AS csp_species,
      csp_translations.family AS csp_family,
      csp_translations.full_name AS csp_full_name,
      csp_translations.taxon_info AS csp_taxon_info
    FROM
      csp_translations
    ORDER BY
      csp_translations.site,
      csp_translations.tree_code
  ) csp_sub_query ON (csp_sub_query.csp_site = plots.plot_code AND csp_sub_query.csp_tree_code = trees.tree_code)
;

GRANT SELECT ON basic_tree_view TO gemdata_reader;

-- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- ---

CREATE VIEW basic_branch_view AS
SELECT
  branches.id AS branch_id,
  branches.code AS branch_code,
  CASE
    WHEN branch_code LIKE '%S' THEN 'SUN'
    WHEN branch_code LIKE '%H' THEN 'SHADE'
  END AS sun_shade,
  basic_tree_view.tree_id AS tree_id,
  basic_tree_view.tree_code AS tree_code,
  basic_tree_view.fp_tree_id AS fp_tree_id,
  basic_tree_view.fp_species_name AS fp_species_name,
  basic_tree_view.fp_species_id AS fp_species_id,
  basic_tree_view.fp_genus_name AS fp_genus_name,
  basic_tree_view.fp_genus_id AS fp_genus_id,
  basic_tree_view.fp_family_name AS fp_family_name,
  basic_tree_view.fp_family_apg_id AS fp_family_apg_id,
  basic_tree_view.sub_plot_code AS sub_plot_code,
  basic_tree_view.plot_code AS plot_code,
  basic_tree_view.csp_site AS csp_site,
  basic_tree_view.csp_tree_code AS csp_tree_code,
  basic_tree_view.csp_species AS csp_species,
  basic_tree_view.csp_family AS csp_family,
  basic_tree_view.csp_full_name AS csp_full_name,
  basic_tree_view.csp_taxon_info AS csp_taxon_info  
FROM
  branches
  INNER JOIN basic_tree_view ON (basic_tree_view.tree_id = branches.tree_id)
;

GRANT SELECT ON basic_branch_view TO gemdata_reader;

-- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- ---

CREATE VIEW basic_leaf_view AS
SELECT
  leaves.id AS leaf_id,
  leaves.code as leaf_code,
  basic_branch_view.branch_id as branch_id,
  basic_branch_view.branch_code AS branch_code,
  basic_branch_view.tree_id AS tree_id,
  basic_branch_view.tree_code AS tree_code,
  basic_branch_view.fp_tree_id AS fp_tree_id,
  basic_branch_view.fp_species_name AS fp_species_name,
  basic_branch_view.fp_species_id AS fp_species_id,
  basic_branch_view.fp_genus_name AS fp_genus_name,
  basic_branch_view.fp_genus_id AS fp_genus_id,
  basic_branch_view.fp_family_name AS fp_family_name,
  basic_branch_view.fp_family_apg_id AS fp_family_apg_id,
  basic_branch_view.sub_plot_code AS sub_plot_code,
  basic_branch_view.plot_code AS plot_code,
  basic_branch_view.csp_site AS csp_site,
  basic_branch_view.csp_tree_code AS csp_tree_code,
  basic_branch_view.csp_species AS csp_species,
  basic_branch_view.csp_family AS csp_family,
  basic_branch_view.csp_full_name AS csp_full_name,
  basic_branch_view.csp_taxon_info AS csp_taxon_info  
FROM
  leaves
  INNER JOIN basic_branch_view ON (basic_branch_view.branch_id = leaves.branch_id)
;

GRANT SELECT ON basic_leaf_view TO gemdata_reader;

-- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- ---

CREATE VIEW basic_leaf_part_view AS
SELECT
  leaf_parts.id as leaf_part_id,
  leaf_parts.code as leaf_part_code,
  basic_leaf_view.leaf_id AS leaf_id,
  basic_leaf_view.leaf_code AS leaf_code,
  basic_leaf_view.branch_id as branch_id,
  basic_leaf_view.branch_code AS branch_code,
  basic_leaf_view.tree_id AS tree_id,
  basic_leaf_view.tree_code AS tree_code,
  basic_leaf_view.fp_tree_id AS fp_tree_id,
  basic_leaf_view.fp_species_name AS fp_species_name,
  basic_leaf_view.fp_species_id AS fp_species_id,
  basic_leaf_view.fp_genus_name AS fp_genus_name,
  basic_leaf_view.fp_genus_id AS fp_genus_id,
  basic_leaf_view.fp_family_name AS fp_family_name,
  basic_leaf_view.fp_family_apg_id AS fp_family_apg_id,
  basic_leaf_view.sub_plot_code AS sub_plot_code,
  basic_leaf_view.plot_code AS plot_code,
  basic_leaf_view.csp_site AS csp_site,
  basic_leaf_view.csp_tree_code AS csp_tree_code,
  basic_leaf_view.csp_species AS csp_species,
  basic_leaf_view.csp_family AS csp_family,
  basic_leaf_view.csp_full_name AS csp_full_name,
  basic_leaf_view.csp_taxon_info AS csp_taxon_info  
FROM
  leaf_parts
  INNER JOIN basic_leaf_view ON (basic_leaf_view.leaf_id = leaf_parts.leaf_id)
;

GRANT SELECT ON basic_leaf_part_view TO gemdata_reader;

-- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- ---


