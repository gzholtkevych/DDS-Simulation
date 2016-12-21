import random

from dds_simulation.experiments.node import Node
from dds_simulation.experiments.link import Link
from dds_simulation.experiments.dataunit import Dataunit


class DDS(object):

    def __init__(self, graph, distribution, dataunits):
        self.nodes = graph.nodes()
        self.links = graph.edges()

        self.neighbors = []

        for node_ident in self.nodes:
            neighbors = graph.neighbors(node_ident)
            self.nodes.append(Node(node_ident, neighbors))

        for node1, node2 in self.links:
            self.links.append(Link(node1, node2))

        self.dataunits = DDS.generate_data(dataunits)
        self.distributed_data(distribution)

    @staticmethod
    def generate_data(dataunits):
        return [Dataunit(i) for i in range(dataunits)]

    def distributed_data(self, distribution):
        # NOTE(galyna): later on make separate module distribution
        if distribution == 'random':
            dataunits_per_node = random.sample(
                [i for i in range(self.dataunits)],
                random.randint(1, len(self.dataunits))
            )
            for node in self.nodes:
                node.add_dataunits(dataunits_per_node)

    def add_link(self):
        pass

    def add_node(self):
        pass

    def delete_link(self):
        pass

    def delete_node(self):
        pass

    def simulate_message(self):
        """Starts communication process.

        Starts communication process starting from one of
        nodes.
        """
        pass

    def track_delivery_time(self):
        pass

    def track_replicas_on_nodes(self):
        pass

    def represent_current_state(self):
        pass
