require 'pp'    
require 'rb_routing'
require "benchmark"

dataset_name = ARGV[0]

def get_vertices(db, percentage)
    vertices = db[:ways_vertices_pgr]
    node_ids = []
    vertices.each{|doc| node_ids << doc[:id]}

    total_size = node_ids.size
    needed_size = percentage*total_size/100

    return node_ids.shuffle.first(needed_size.to_i)
end

def run_tests(dataset_name, percentage)
    router = RbRouting::Router::Dijkstra.new  :host => 'localhost', :database => dataset_name, :user => 'sarthak', :edge_table => :ways ,:id => :gid, :cost => :cost, :reverse_cost => :reverse_cost 
    db = router.db

    sources_vertices = get_vertices(db, percentage)
    dest_vertices = get_vertices(db, percentage)

    time = 0
    time += Benchmark.realtime do
        sources_vertices.each do |source|
            dest_vertices.each do |dest|
                router.run :source => source, :target => dest
            end
        end        
    end
    return time
end


test_results = {}

test_results[1] = run_tests(dataset_name, 1)
test_results[10] = run_tests(dataset_name, 10)
test_results[50] = run_tests(dataset_name, 50)
test_results[100] = run_tests(dataset_name, 100)


output_file_name = dataset_name + "_test_results.txt"
File.open(output_file_name, 'w') { |file| file.write(test_results) }
