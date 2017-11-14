import abc
import random

import networkx

from dds_simulation.experiments.node import Node
from dds_simulation.experiments.link import Link
from dds_simulation.experiments.dataunit import Dataunit

from dds_simulation.visualisation import graph_control, extrapolation


class DDS(object):
    """
    Base class for all experiments
    """
    __metaclass__ = abc.ABCMeta

    def __init__(self, graph):
        self.nodes = list()
        self.links = set()
        self.graph = graph

    @abc.abstractmethod
    def start_experiment(self):
        """Starting one of experiments"""


class DDSMessaging(DDS):
    """
    Class simulating messaging broadcasting across DDS
    """

    def __init__(self, graph, distribution, dataunits_number):
        super(DDSMessaging, self).__init__(graph)
        self.controller = graph_control.GraphController(graph)
        self.time_slots_taken = 0
        self.diameter = networkx.diameter(graph)
        self.controller = graph_control.GraphController(graph)
        self.nodes = []
        for node_ident in graph.nodes():
            neighbors = graph.neighbors(node_ident)
            self.nodes.append(Node(node_ident, neighbors))

        for node1, node2 in graph.edges():
            self.links.add(Link(node1, node2))


        self.dataunits = DDSMessaging.generate_data(dataunits_number)
        self.distribute_data(distribution)

    @staticmethod
    def generate_data(dataunits):
        return [Dataunit(i) for i in range(dataunits)]

    def distribute_data(self, distribution):
        # NOTE(galyna): later on make separate module distribution
        if distribution == 'random':
            dataunits_per_node = random.sample(
                self.dataunits,
                random.randint(1, len(self.dataunits))
            )
            for node in self.nodes:
                node.add_dataunits(dataunits_per_node)

    def start_experiment(self):
        self.simulate_message()

    def _simulate_message_single_iteration(self, node_identity,
                                           nodes_processed):
        neighbors = self.graph.neighbors(node_identity)
        print("Node: ", node_identity)
        print("NEIGHBORS: ", neighbors)

        # assume now that go to each node takes 1 ts, broadcasting parallel
        #print("ts taken>>> ", self.time_slots_taken)

        nodes_processed.update(set(neighbors))
        nodes_processed.update(set([node_identity, ]))
        return neighbors

    def _simulate_parallel_iterations(self):
        pass


    def simulate_message(self):
        """Simulate communication process.

        Simulate communication process starting from one of
        nodes.
        """
        dataunit_id = random.randint(0, len(self.dataunits))
        # only first node is taken at random
        node_identity = random.randint(0, len(self.nodes) - 1)
        self.time_slots_taken = 0

        # if dataunit_id in self.nodes[node_identity].dataunits_ids:
        #     self.time_slots_taken += 1

        #self.controller.message_broadcast([node_identity], [])

        labels = {k.identity: k.identity for k in self.nodes}
        new_neighbors = []
        nodes_processed = set([node_identity])

        neighbors = self.graph.neighbors(node_identity)

        nodes_processed.update(set(neighbors))
        self.time_slots_taken += 1

        while len(nodes_processed) < len(self.nodes):

            # ноды должны тоже выбираться параллельно, а не только одна, должны передавать сообщение
            # ВСЕ соседи ПАРАЛЛЕЛЬНО
            for i in neighbors:
                new_neighbors.extend(self.graph.neighbors(i))

            nodes_processed.update(set(new_neighbors))

            self.time_slots_taken += 1

            neighbors.clear()
            neighbors = new_neighbors[:]
            new_neighbors.clear()

        # self.controller.draw_graph(
        #     self.graph, labels, f'{self.time_slots_taken}-{self.diameter}')

    def get_delivery_time(self):
        """Useful for interactive mode now"""
        return self.time_slots_taken

    def track_replicas_on_nodes(self):
        """Useful for interactive mode now"""
        pass

    def represent_current_state(self):
        """Useful for interactive mode now"""
        pass
