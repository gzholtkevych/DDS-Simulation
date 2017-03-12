from multiprocessing import Pool, Process

import networkx as nx

from dds_simulation.conf import default
from dds_simulation.graphs import graph_building
from dds_simulation.graphs import graph_control
from dds_simulation.experiments import simulation


def foo(animation):
    from random import randint

    animation.nodes = [randint(0, 9)]


if __name__ == '__main__':

    nodes = int(default.parameter('topology', 'nodes'))
    degree = int(default.parameter('topology', 'degree'))
    graph = graph_building.form_graph(nodes, degree)
    dataunits_number = int(default.parameter('dataunit', 'dataunits'))
    distribution = default.parameter('dataunit', 'distribution')

    controller = graph_control.GraphController(graph)
    dds_service = simulation.DDS(graph, controller, distribution,
                                 dataunits_number)
    dds_service.simulate_message()


