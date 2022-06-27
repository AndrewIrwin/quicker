# quicker



## Misc material to add

### to data-storing

https://arrow-user2022.netlify.app/data-wrangling.html
Writing about DuckDB, Danielle Navarrow writes: "Think of it as like SQLite, with a major exception: it’s intended to support analytics workflows (fewer queries, but computationally expensive ones) rather than transactional ones (many queries that touch only a small part of the database). For the kind of workflows a data scientist tends to engage in, it’s usually much faster than SQLite. Plus, it comes with Arrow support, and consequently the arrow and duckdb packages play very nicely together."

Data in arrow files can be handed off to DuckDB tools to enable analytics queries with no data transfer costs. Up to 10x faster than SQLite.
https://jthomasmock.github.io/bigger-data/#7

Add data.table::fread() for fast reading - dtplyr for dplyr interface to data.table
and vroom::vroom()
collapse package for limited tools, but fast

