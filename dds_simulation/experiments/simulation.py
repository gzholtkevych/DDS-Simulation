from dds_simulation.experiments.node import Node
from dds_simulation.experiments.link import Link


class DDS(object):

    def __init__(self):
        self.nodes = [Node()]
        self.links = []

    def add_link(self):
        pass

    def add_node(self):
        pass

    def delete_link(self):
        pass

    def delete_node(self):
        pass

    def send_message(self):
        """Starts communication process.

        Starts communication process starting from one of
        nodes.
        """
        pass

    def track_replicas_on_nodes(self):
        pass

    def track_delivery_time(self):
        pass

    def send_current_state_to_graph(self):
        pass
