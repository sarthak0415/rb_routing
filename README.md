```sql
#Postgres start server  
brew services start postgresql

#Login
psql <database_name>

#create new db and connect
CREATE DATABASE routing1;
\connect routing1

#create extensions
create extension postgis;
create extension pgrouting;
CREATE EXTENSION hstore;

osm2pgrouting --f iiit_map.osm --conf mapconfig.xml --dbname routing --username sarthak --clean
```

```shell
sudo rm pkg/rb_routing-0.0.1.gem
rake install 
gem install  pkg/rb_routing-0.0.1.gem
```

```ruby
require 'pp'	
require 'rb_routing'
router = RbRouting::Router::Dijkstra.new  :host => 'localhost', :database => 'routing', :user => 'sarthak', :edge_table => :ways ,:id => :gid, :cost => :cost, :reverse_cost => :reverse_cost 
router.run :source => 3, :target => 4
```
