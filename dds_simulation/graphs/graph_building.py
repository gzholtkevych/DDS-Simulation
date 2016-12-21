import networkx as nx


def form_graph(nodes_number, degree=5):
    return nx.random_regular_graph(degree, nodes_number)

