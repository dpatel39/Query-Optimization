
create index part_pType on part(p_type);         -- query2
create index part_pSize on part(p_size);		 -- query 2

--create index l_orderkey_shipdate_idx on lineitem (l_orderkey, l_shipdate); 	-- query3
--create index orders_orderdate on orders (o_orderdate);				-- query3


create index orders_orderpriority_orderdate_ix on orders (o_orderpriority,o_orderdate);		-- query4
--create index l_commitdate_receiptdate_idx on lineitem  (l_commitdate, l_receiptdate);	-- query4



	--create index lineitem_commitdate on lineitem (l_commitdate asc);
