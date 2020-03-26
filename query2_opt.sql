-- old times: 0.432, 0.451, 0.441, 0.445, 0.443
-- new times:0.008, 0.008, 0.007, 0.008, 0.008

.timer on
SELECT 
	s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM 
	part, supplier, partsupp, nation, region
WHERE 
	p_partkey = ps_partkey 
	AND s_suppkey = ps_suppkey
	AND p_size = 11 -- [SIZE]
	AND p_type like 'MEDIUM BRUSHED COPPER' -- '%[TYPE]'
	AND s_nationkey = n_nationkey
	AND n_regionkey = r_regionkey
	AND r_name = 'ASIA' -- '[REGION]'
	AND ps_supplycost = (
		SELECT 
			min(ps_supplycost) 
		FROM 
			partsupp, supplier, nation, region 
		WHERE
			p_partkey = ps_partkey
			AND s_suppkey = ps_suppkey
			AND s_nationkey = n_nationkey
			AND n_regionkey = r_regionkey
			AND r_name = 'ASIA' -- '[REGION]'
		)
ORDER BY
	s_acctbal DESC,
	n_name,
	s_name,
	p_partkey;