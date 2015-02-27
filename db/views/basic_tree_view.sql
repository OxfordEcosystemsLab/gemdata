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

