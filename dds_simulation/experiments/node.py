from dds_simulation.experiments.dataunit import Dataunit

class Node(object):

    def __init__(self, identity, neighbors):
        self.identity = identity
        self.neighbors = neighbors

    def add_dataunits(self, dataunits):
        self.dataunits = [Dataunit(i) for i in range(dataunits)]

    def run(self):
        """
        listen to requests from client
        once a request came send it to process as asynchronous task

        task:
        send task to update to others neighbors
        if this dataunit exists on this node,
        block on this dataunit while it updates dataunit
        """
        pass

    def put(self):
        # updates dataunit
        pass

    def post(self):
        # insert new dataunit depending on the request
        pass

    def get(self):
        # find appropriate dataunit
        pass
