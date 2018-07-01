require 'pp'    
require 'rb_routing'
require "benchmark"

def get_vertices(db, percentage)
    vertices = db[:ways_vertices_pgr]
    node_ids = []
    vertices.each{|doc| node_ids << doc[:id]}

    total_size = node_ids.size
    needed_size = percentage*total_size/100

    return node_ids.shuffle.first(needed_size.to_i)
end

def run_tests(percentage)
    dataset_name = 'iiit'

    router = RbRouting::Router::Dijkstra.new  :host => 'localhost', :database => dataset_name, :user => 'sarthak', :edge_table => :ways ,:id => :gid, :cost => :cost, :reverse_cost => :reverse_cost 
    db = router.db

    sources_vertices = get_vertices(db, percentage)
    dest_vertices = get_vertices(db, percentage)

    time = 0
    sources_vertices.each do |source|
        dest_vertices.each do |dest|
            time += Benchmark.realtime do
                router.run :source => source, :target => dest
            end
        end
    end
    return time
end


test_results = {}

test_results[1] = run_tests(10)
test_results[10] = run_tests(20)
test_results[50] = run_tests(80)
test_results[100] = run_tests(100)


File.open('test_results', 'w') { |file| file.write(test_results) }
