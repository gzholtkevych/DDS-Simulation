from matplotlib import pyplot as plt
from matplotlib import animation
import networkx as nx
import random as rand


def form_graph(nodes_number, degree=5):
    return nx.random_regular_graph(degree, nodes_number)


class Animator(object):
    """Animates graph"""

    labels = {}

    def __init__(self, graph, position):
        self.fig = plt.figure()
        self.graph = graph
        self.graph_position = position
        for node in graph.nodes():
            self.labels[node] = node

    def initiate(self):
        self.draw_graph()

    def animate(self, i):
        self.redraw_graph(5)

    def draw_graph(self):
        nx.draw_networkx_nodes(self.graph, self.graph_position,
                               nodelist=self.graph.nodes(),
                               node_color='g',
                               node_size=500,
                               alpha=0.8)

        nx.draw_networkx_edges(self.graph, self.graph_position,
                               edgelist=self.graph.edges(),
                               alpha=0.5)
        nx.draw_networkx_labels(self.graph, self.graph_position, self.labels,
                                font_size=16)

    def redraw_graph(self, highlighted_node):
        nx.draw_networkx_nodes(self.graph, self.graph_position,
                               nodelist=[highlighted_node],
                               node_color='g',
                               node_size=500,
                               alpha=0.8)
        others = self.graph.nodes().copy()
        others.remove(highlighted_node)
        nx.draw_networkx_nodes(self.graph, self.graph_position,
                               nodelist=others,
                               node_size=500,
                               alpha=0.8)

        highlighted_edges = self.graph.edges(highlighted_node)

        nx.draw_networkx_edges(self.graph, self.graph_position,
                               edgelist=highlighted_edges,
                               edge_color='g',
                               alpha=0.5)

    def draw_animation(self):
        ani = animation.FuncAnimation(self.fig, self.animate,
                                      init_func=self.initiate,
                                      interval=1000)
        ani.save('graph.mp4')
