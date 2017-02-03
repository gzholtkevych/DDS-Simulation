import random
from eventlet import GreenPool

from dds_simulation.experiments.node import Node
from dds_simulation.experiments.link import Link
from dds_simulation.experiments.dataunit import Dataunit


class DDS(object):

    def __init__(self, graph, distribution, dataunits):
        self.nodes = []
        self.links = set()
        self.graph = graph

        for node_ident in graph.nodes():
            neighbors = graph.neighbors(node_ident)
            self.nodes.append(Node(node_ident, neighbors))

        for node1, node2 in graph.edges():
            self.links.add(Link(node1, node2))

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

    def simulate_message(self, message):
        """Simulate communication process.

        Simulate communication process starting from one of
        nodes.
        """
        dataunit_id = random.randint(0, len(self.dataunits))
        message = {'data': 'some change', 'id': dataunit_id}
        node_identity = random.randint(0, self.nodes)
        dataunits_delivered = 0
        # 1 time slot when initial node updates own dataunit
        time_slots_taken = 0
        if dataunit_id in self.nodes[node_identity].dataunits_ids:
            time_slots_taken += 1
        nodes_processed = [self.nodes[node_identity]]
        while dataunits_delivered <= len(self.nodes):
            # STUB 1 timeslot through each link. requests are broadcaseted in parallel
            time_slots_taken += 1
            neighbors = self.nodes[node_identity].neighbors
            next_nodes = list(filter(lambda n: n not in nodes_processed, neighbors))
            time_slots_taken += 1

            nodes_processed.extend(next_nodes)

            dataunits_delivered += len(next_nodes)

        return time_slots_taken

    def one_node_iteration(self):
        pass

    def track_delivery_time(self):
        pass

    def track_replicas_on_nodes(self):
        pass

    def represent_current_state(self):
        pass
