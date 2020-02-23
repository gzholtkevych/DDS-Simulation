import os

from matplotlib import pyplot
from dds_simulation.conf.default import PROJECT_ROOT
from dds_simulation.experiments.constants import AVAILABILITY_THRESHOLD


def draw_availability_graph(writes, total_nodes, data, alg_folder):
    filename = f'w_{writes}_r_{total_nodes}'
    draw_function(data, 'dataunits', 'consistent nodes', filename, alg_folder)


def draw_function(data, x_label, y_label, filename, alg_folder):
    pyplot.figure(dpi=600)
    pyplot.xlabel(x_label)
    pyplot.ylabel(y_label)
    # draw the consiostent nodes varying
    x = list(data.keys())
    pyplot.plot(x, list(data.values()), color='blue')
    # draw the threshold line
    pyplot.plot([0, x[-1]], [AVAILABILITY_THRESHOLD, AVAILABILITY_THRESHOLD], color='red')
    path = os.path.join(PROJECT_ROOT, 'results', alg_folder,
                        f'{filename}.png')
    pyplot.savefig(path, dpi=600)
