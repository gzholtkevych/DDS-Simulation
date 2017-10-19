import os
from uuid import uuid4

from matplotlib import pyplot

from dds_simulation.conf.default import PROJECT_ROOT


def draw_extrapolation(x_vector, y_vector, partitions_number):
    pyplot.figure()
    pyplot.ylim(0,1)
    pyplot.ylabel('I(U)')

    pyplot.plot(x_vector, y_vector, color='b', linewidth=3.0)

    path = os.path.join(PROJECT_ROOT, 'results',
                        '{}-consistent-partitions-inconsistency'.format(
                            partitions_number))
    pyplot.savefig(path)


def draw_probability_extrapolation(x_vector, y_vector, partitions,
                                   nodes_number, average):
    pyplot.figure()
    pyplot.ylim(0, 1)
    pyplot.ylabel('I({}) = {}'.format(partitions, average))
    pyplot.plot(x_vector, y_vector, color='b', linewidth=2.0)

    path = os.path.join(PROJECT_ROOT, 'results',
                        '{}-consistent-partitions-probability-{}-nodes-{}'.format(
                            partitions, nodes_number, uuid4().hex))
    pyplot.savefig(path)