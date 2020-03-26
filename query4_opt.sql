.timer on
--explain query plan
SELECT o_orderpriority,
       count( 1 ) AS order_count
  FROM orders
 WHERE o_orderdate >= "1993-07-01"/* '[DATE]' */ AND 
       o_orderdate < "1993-10-01"/* '[DATE]' */ AND 
       EXISTS (
           SELECT 1            -- 1 instead of * scans only 1 column 
            FROM lineitem 
            WHERE l_orderkey = o_orderkey AND 
                  l_commitdate < l_receiptdate
       )
 GROUP BY o_orderpriority
 ORDER BY o_orderpriority;
;