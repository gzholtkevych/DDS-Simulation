from multiprocessing import Process
import random

from dds_simulation.experiments.node import Node
from dds_simulation.experiments.link import Link
from dds_simulation.experiments.dataunit import Dataunit


class DDS(object):

    def __init__(self, graph, controller, distribution, dataunits_number):
        self.nodes = []
        self.links = set()
        self.graph = graph
        self.controller = controller

        for node_ident in graph.nodes():
            neighbors = graph.neighbors(node_ident)
            self.nodes.append(Node(node_ident, neighbors))

        for node1, node2 in graph.edges():
            self.links.add(Link(node1, node2))

        self.dataunits = DDS.generate_data(dataunits_number)
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

    def simulate_message(self):
        """Simulate communication process.

        Simulate communication process starting from one of
        nodes.
        """
        dataunit_id = random.randint(0, len(self.dataunits))
        node_identity = random.randint(0, len(self.nodes))
        # 1 time slot when initial node updates own dataunit
        time_slots_taken = 0
        if dataunit_id in self.nodes[node_identity].dataunits_ids:
            time_slots_taken += 1

        self.controller.message_broadcast([node_identity], [])

        nodes_processed = set([node_identity])
        print("Nodes processed before: ", nodes_processed)
        while len(nodes_processed) < len(self.nodes):
            time_slots_taken += 1
            print("Iteration 1")
            neighbors = self.nodes[node_identity].neighbors
            #next_nodes = set(neighbors) - nodes_processed
            # assume now that go to each node takes 1 ts, broadcasting parallel
            time_slots_taken += 1

            # assume that each node is updating itself also for 1 ts
            time_slots_taken += 1
            nodes_processed.update(set(neighbors))
            print("Nodes processed now: ", nodes_processed)
            self.controller.message_broadcast(list(nodes_processed), [])
            node_identity = random.randint(0, len(neighbors))


        return time_slots_taken

    def track_delivery_time(self):
        pass

    def track_replicas_on_nodes(self):
        pass

    def represent_current_state(self):
        pass
