SELECT m1.genome_db_id, m2.genome_db_id, gdb1.name, gdb2.name
,h.description, count(*)
,AVG(hm1.perc_cov), AVG(hm1.perc_id), AVG(hm1.perc_pos),AVG(hm2.perc_cov), AVG(hm2.perc_id), AVG(hm2.perc_pos)
FROM homology h, homology_member hm1, homology_member hm2, member m1, member m2, genome_db gdb1, genome_db gdb2
WHERE h.homology_id=hm1.homology_id AND hm1.member_id=m1.member_id
AND h.homology_id=hm2.homology_id AND hm2.member_id=m2.member_id
AND m1.genome_db_id != m2.genome_db_id
AND m1.genome_db_id < m2.genome_db_id
AND m1.genome_db_id=gdb1.genome_db_id
AND m2.genome_db_id=gdb2.genome_db_id
GROUP BY m1.genome_db_id, m2.genome_db_id, h.description;
