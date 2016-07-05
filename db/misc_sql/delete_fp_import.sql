BEGIN;

DELETE from dbh_measurements d USING trees t, sub_plots sp, plots p
WHERE  d.tree_id = t.id 
AND t.sub_plot_id = sp.id
AND  sp.plot_id = p.id
AND p.plot_code = 'INSERT_PLOTCODE_HERE';

DELETE from trees t USING sub_plots sp, plots p
WHERE t.sub_plot_id = sp.id
AND  sp.plot_id = p.id
AND p.plot_code = 'INSERT_PLOTCODE_HERE';

COMMIT;   
