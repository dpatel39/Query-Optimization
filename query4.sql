.timer on
SELECT o_orderpriority,
       count( * ) AS order_count
  FROM orders
 WHERE o_orderdate >= "1993-07-01"/* '[DATE]' */ AND 
       o_orderdate < "1993-10-01"/* '[DATE]' */ AND 
       EXISTS (
           SELECT 1
            FROM lineitem 
            WHERE l_orderkey = o_orderkey AND 
                  l_commitdate < l_receiptdate
       )
 GROUP BY o_orderpriority
 ORDER BY o_orderpriority;
;
