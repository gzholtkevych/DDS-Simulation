from copy import deepcopy
import json
import random
import os

from .simulation import DDS
from dds_simulation.conf import default


class ConsistentExperiment(DDS):

    def _form_partitions(self):
        partitions_number = int(default.parameter('experiment', 'partitions'))
        consistent_partitions = []
        nodes = set(deepcopy(self.nodes))
        for i in range(0, partitions_number - 1):
            nodes_for_partition = random.sample(
                nodes,
                random.randint(1, len(nodes))
            )
            consistent_partitions.append(nodes_for_partition)
            nodes -= nodes_for_partition

        # NOTE(galyna): the last partition will be just the remained nodes
        consistent_partitions.append(nodes)
        return consistent_partitions

    def single_experiment(self):
        """
         Experimental method
        
         Calculate the inconsistency state
         :return degree of DDS inconsistency
        """
        # here the partitions are simulated absolutely randomly taking into
        # account configured number of partitions only
        partitions = self._form_partitions()

        random.shuffle(self.nodes)

        found_consistent_partitions = [0 for i in range(0, len(partitions))]
        timeslots = 0
        for i in range(0, self.nodes):
            for j in range(0, len(partitions)):
                if self.nodes[i] in partitions[j]:
                    found_consistent_partitions[j] += 1
                    break
            timeslots += 1
            if any(lambda x: x > 1, found_consistent_partitions):
                break
        return timeslots

    def start_experiment(self):
        experiment_number = int(default.parameter('experiment', 'quantity'))
        results = []
        i = 0
        while i < experiment_number:
            results.append(self.single_experiment())
            i += 1
        with open(os.path.join(os.getcwd(), 'results')) as f:
            json.dump(results, f)
