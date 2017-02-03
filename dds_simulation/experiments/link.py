

class Link(object):

    bandwidth = 1

    def __init__(self, node1, node2):
        self.node1 = node1
        self.node2 = node2

    def transmit(self, message):
        return self.bandwidth
