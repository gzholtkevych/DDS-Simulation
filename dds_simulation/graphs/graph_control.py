from multiprocessing import Process
from multiprocessing import Queue
import random

import networkx as nx
from PyQt5.QtCore import pyqtSignal
from PyQt5.QtCore import QObject

from dds_simulation.graphs.graph_building import Animation
from dds_simulation.graphs.graph_building import plot_graph


class GraphController(object):
    """Class emitting the signals to dredraw links and nodes

    When links are transmitting and nodes obtain message, they
    should change the color. This class controls graph animation thread
    """

    def __init__(self, graph):

        self.queue = Queue()
        self.queue.put_nowait([5])

        animation = Animation(self.queue, graph, nx.circular_layout(graph))
        animator = Process(target=plot_graph, name="Graph Animator",
                           args=(animation,))
        animator.start()

    def message_broadcast(self, nodes, links):

        self.queue.put_nowait(nodes)
