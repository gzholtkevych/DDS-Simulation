import os
from datetime import datetime
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
                                   nodes_number, average, maximum=None):
    pyplot.figure()
    pyplot.ylim(0, 1)
    label = f'I({partitions}) = {average}'
    if maximum is not None:
        label = f'I_max({partitions}) = {maximum}'
    pyplot.ylabel(label)
    pyplot.plot(x_vector, y_vector, color='b', linewidth=2.0)

    path = os.path.join(PROJECT_ROOT, 'results',
                        '{}-max-consistent-partitions-{}-nodes-{}'.format(
                            partitions, nodes_number, uuid4().hex))
    pyplot.savefig(path)


def draw_function(x_vector, y_vector, x_label, y_label, filename):
    pyplot.figure()

    pyplot.xlabel(x_label)
    pyplot.ylabel(y_label)
    print("X >>> ", x_vector)
    print("Y >>>> ", y_vector)

    pyplot.plot(x_vector, y_vector, 'o', color='r', linewidth=2.0)
    x_line = [x_vector[i] for i in range(0, len(x_vector))
              if x_vector[i] == y_vector[i]]
    y_line = x_line[:]
    pyplot.plot(x_line, y_line, color='k', linewidth=2.0)
    path = os.path.join(PROJECT_ROOT, 'results',
                        f'{filename}.png')
    pyplot.savefig(path)
