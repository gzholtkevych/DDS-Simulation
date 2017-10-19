
from dds_simulation.conf import default
from dds_simulation.visualisation import graph_building
from dds_simulation.visualisation import graph_control, extrapolation
from dds_simulation.experiments import simulation
from dds_simulation.experiments import consistent_partitions


if __name__ == '__main__':

    nodes = int(default.parameter('topology', 'nodes'))
    degree = int(default.parameter('topology', 'degree'))
    graph = graph_building.form_graph(nodes, degree)
    dataunits_number = int(default.parameter('dataunit', 'dataunits'))
    distribution = default.parameter('dataunit', 'distribution')

    dds_service = consistent_partitions.ConsistentExperiment(
        graph, None, distribution, dataunits_number)
    dds_service.start_experiment()


