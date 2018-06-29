require 'pp'	
require 'rb_routing'
router = RbRouting::Router::Dijkstra.new  :host => 'localhost', :database => 'routing', :user => 'sarthak', :edge_table => :ways ,:id => :gid, :cost => :cost, :reverse_cost => :reverse_cost 
router.run :source => 3, :target => 4
