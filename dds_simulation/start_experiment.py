import random

import networkx

from dds_simulation.conf import default
from dds_simulation.visualisation import graph_building

from dds_simulation.experiments import simulation
from dds_simulation.experiments import consistent_partitions
from dds_simulation.visualisation.extrapolation import draw_function


def _initiate_dds(distribution, dataunits_number):
    degree = random.randint(2, 30) // 2 * 2
    nodes = degree * 7
    graph = graph_building.form_graph(nodes, degree)

    try:
        return simulation.DDSMessaging(graph, distribution,
                                              dataunits_number)
    except networkx.exception.NetworkXError:
        return _initiate_dds(distribution, dataunits_number)


if __name__ == '__main__':

    nodes = int(default.parameter('topology', 'nodes'))
    edges = int(default.parameter('topology', 'links'))
    degree = int(default.parameter('topology', 'degree'))
    experiments = int(default.parameter('experiment', 'experiments'))

    dataunits_number = int(default.parameter('dataunit', 'dataunits'))
    distribution = default.parameter('dataunit', 'distribution')
    x_vector = []
    y_vector = []


    for i in range(experiments):

        dds_service = _initiate_dds(distribution, dataunits_number)
        dds_service.start_experiment()

        x_vector.append(dds_service.time_slots_taken)
        y_vector.append(dds_service.diameter)

    draw_function(x_vector, y_vector, 'T_c', 'D(G)',
                  f'{experiments}-consistency-convergence')

