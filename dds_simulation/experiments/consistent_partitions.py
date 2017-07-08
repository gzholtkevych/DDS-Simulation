from itertools import combinations
import random

from .simulation import DDS
from dds_simulation.visualisation import extrapolation
from dds_simulation.conf import default


class ConsistentExperiment(DDS):

    def _form_random_partitions(self):
        partitions_number = int(default.parameter('experiment', 'partitions'))
        consistent_partitions = []
        nodes = set([node.identity for node in self.nodes])

        for i in range(0, partitions_number - 1):
            nodes_for_partition = set(random.sample(
                nodes,
                random.randint(1, len(nodes))
            ))
            consistent_partitions.append(nodes_for_partition)
            nodes -= nodes_for_partition

        # NOTE(galyna): the last partition will be just the remained nodes
        consistent_partitions.append(nodes)
        return consistent_partitions

    def _form_partitions(self, partition):

        consistent_partitions = []
        nodes = set([node.identity for node in self.nodes])

        for nodes_number in partition:
            nodes_for_partition = set(random.sample(
                nodes,
                nodes_number)
            )
            consistent_partitions.append(nodes_for_partition)
            nodes -= nodes_for_partition

        # NOTE(galyna): the last partition will be just the remained nodes
        if nodes:
            consistent_partitions.append(nodes)
        return consistent_partitions

    def single_iteration(self, partition, nodes):
        """
         Experimental method
        
         Calculate the inconsistency state by calculating number of compare
         operations to find two consistent nodes.

         :return degree of DDS inconsistency
        """
        print("________________________")
        taking_count = len(partition)
        found_consistent_counts = [0 for i in range(0, taking_count)]
        inconsistency = 0

        random.shuffle(nodes)

        count = 0
        consistent_partitions = self._form_partitions(partition)
        for partition in consistent_partitions:
            for i in range(0, taking_count):
                random_node = random.randint(0, len(nodes))
                print("random node {} in partition {} - {}".format(random_node,
                                                                   partition,
                                                              random_node in
                                                              partition))
                if random_node in partition:
                    found_consistent_counts[i] += 1
            print("found:", found_consistent_counts)
            if any(x > 1 for x in found_consistent_counts):
                return inconsistency

            count += 1

        inconsistency = 1
        return inconsistency

    def multiple_partitions(self, partitions_number):
        experiment_number = int(default.parameter('experiment', 'experiments'))
        sub_experiments = int(default.parameter('experiment',
                                               'sub_experiments'))
        nodes = [node.identity for node in self.nodes]
        partitions = filter(lambda partition: sum(partition) == len(nodes),
                   combinations(nodes, partitions_number))

        y = []
        x = []

        i = 0
        j = 0
        for part in partitions:
            print(part)
            while i < experiment_number:
                while j < sub_experiments:

                    x.append(j)
                    y.append(self.single_iteration(part, nodes))
                    j += 1

                i += 1

            # probability of inconsistency:
            inconsistency_probability = sum(y) / len(y)
        print("__________________________")
        print(y)
        print(x)
        average = sum(y) / len(y)
        extrapolation.draw_probability_extrapolation(
            x, y, part, len(nodes), average)

        return y

    def start_experiment(self):

        partitions = int(default.parameter('experiment', 'partitions'))

        inconsistency_states = self.multiple_partitions(partitions)
        return inconsistency_states



