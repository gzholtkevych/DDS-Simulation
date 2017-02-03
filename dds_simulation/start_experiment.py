from dds_simulation.conf import default
from dds_simulation.graphs import graph_building
from dds_simulation.experiments import simulation

if __name__ == '__main__':

    nodes = int(default.parameter('topology', 'nodes'))
    degree = int(default.parameter('topology', 'degree'))
    graph = graph_building.form_graph(nodes, degree)
    dataunits = int(default.parameter('dataunit', 'dataunits'))
    distribution = default.parameter('topology', 'distribution')

    dds_service = simulation.DDS(graph)
    dds_service.simulate_message()

