.timer on
SELECT o_orderkey,          -- instead of l_orderkey,
       sum(l_extendedprice * (1 - l_discount) ) AS revenue,
       o_orderdate,
       o_shippriority
  FROM lineitem,
       orders
 WHERE 
       l_orderkey = o_orderkey AND 
       o_orderdate < '1995-03-15'/* '[DATE]' */ AND 
       l_shipdate > '1995-03-15'-- '[DATE]'
       and 
/*use of sub query instead of customer join since there is no column in output result set) */ 
      o_custkey in (select c_custkey from customer where
       c_mktsegment = 'BUILDING'/* '[SEGMENT]' */ ) 
 GROUP BY o_orderkey,         -- instead of l_orderkey,
          o_orderdate,
          o_shippriority
 ORDER BY revenue DESC,
          o_orderdate;
