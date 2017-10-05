from copy import deepcopy
from itertools import combinations_with_replacement
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

    def single_iteration(self, partition, nodes_original):
        """
         Experimental method

         Calculate the inconsistency state by calculating number of compare
         operations to find two consistent nodes.

         :return degree of DDS inconsistency
        """
        i = 0
        consistent_partitions = self._form_partitions(partition)
        taking_count = 2
        found_inconsistent_counts = [0 for i in
                                     range(0, len(consistent_partitions))]
        print("cons parts: ", consistent_partitions)

        for partition in consistent_partitions:
            nodes = deepcopy(nodes_original)
            random.shuffle(nodes)
            print("partition: ", partition)

            taken = set(random.sample(nodes, taking_count))
            print("====== TAKEN =-====", taken)
            if not taken.issubset(partition):
                found_inconsistent_counts[i] += 1
            i += 1
        print(found_inconsistent_counts)
        return found_inconsistent_counts

    def multiple_partitions(self, partitions_number):
        experiment_number = int(default.parameter('experiment', 'experiments'))
        sub_experiments = int(default.parameter('experiment',
                                                'sub_experiments'))
        nodes = [node.identity for node in self.nodes]

        partitions_invariants = [i + 1 for i in range(len(nodes))]
        partitions = list(
            filter(lambda partition: sum(partition) == len(nodes),
                   combinations_with_replacement(
                       partitions_invariants, partitions_number)))

        y = []
        x = []
        inconsistency_array = []

        for part in partitions:
            i = 0
            print("=========================================")
            print("PARTITION: ", part)

            while i < experiment_number:
                taking_result = self.single_iteration(part, nodes)
                print(taking_result)
                single_probability = sum(taking_result) / len(taking_result)
                print("SINGLE PROBABILITY:", single_probability)
                inconsistency_array.append(single_probability)

                print("Y probabilities: ", inconsistency_array)
                probability = sum(inconsistency_array) / len(
                    inconsistency_array)
                inconsistency_array.clear()
                x.append(i)
                y.append(probability)
                i += 1

            print("=========================================")
            print("AVERAGE =================================")

            # probability of inconsistency:
            average = sum(y) / len(y)
            print(average)
            extrapolation.draw_probability_extrapolation(
                x, y, part, len(nodes), average)
            x.clear()
            y.clear()

        return x, y

    def start_experiment(self):

        partitions = int(default.parameter('experiment', 'partitions'))

        inconsistency_states = self.multiple_partitions(partitions)
        return inconsistency_states
