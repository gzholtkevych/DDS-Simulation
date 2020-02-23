import asyncio
from datetime import datetime
import json
import os
import random
import time
from dds_simulation.experiments.constants import (AVERAGE_TIME_READ, AVERAGE_TIME_WRITE,
                                                  GRAPH_DEGREE, AVAILABILITY_THRESHOLD)
from dds_simulation.conf.default import PROJECT_ROOT


async def run(nodes_number, dataunits_number, writes_number):
    """

    :param nodes:
    :return:
    """
    # how many request
    # add many dataunits (1000)
    dataunits = [i for i in range(dataunits_number)]
    Application.init_app(nodes_number=nodes_number, dataunits=dataunits)

    write_requests = [{'dataunit': random.randint(0, dataunits_number - 1)} for i in range(writes_number)]

    reads_number = int(writes_number * 3 / 2)
    read_requests = [{'dataunit': random.randint(0, dataunits_number - 1)} for i in range(reads_number)]

    writes = asyncio.gather(*([asyncio.ensure_future(Node.write(request)) for request in write_requests]))
    reads = asyncio.gather(*([
        asyncio.ensure_future(Node.read(request)) for request in read_requests]))

    spread_tasks_number = (reads_number + writes_number) * 2
    spreads = asyncio.gather(*([asyncio.ensure_future(Node.spread_replica(nodes_number))
                                for i in range(spread_tasks_number)]))

    getting_state = asyncio.gather(*([asyncio.ensure_future(Application.get_state())] * 10))

    await asyncio.gather(writes, reads, spreads, getting_state)


class Application:
    storage = None
    replicas = None
    nodes_number = None
    dataunits = None

    @classmethod
    def init_app(cls, **kwargs):
        cls.nodes_number = kwargs.get('nodes_number')
        cls.dataunits = kwargs.get('dataunits')
        cls.storage = dict.fromkeys(cls.dataunits, set())
        for key in cls.storage:
            cls.storage[key] = set(random.sample(
                [i for i in range(cls.nodes_number)],
                random.randint(0, cls.nodes_number)
            ))

        cls.replicas = dict.fromkeys(cls.dataunits, 0)

    @classmethod
    async def get_state(cls):
        await asyncio.sleep(random.uniform(0.5, 20))
        print("GETTING STATE")
        state = {dataunit: len(cls.storage[dataunit]) for dataunit in cls.storage}
        print(state.values())

        ts = datetime.fromtimestamp(time.time())
        with open(os.path.join(PROJECT_ROOT, 'results', 'own_balancing',
                               f'alg_{len(cls.storage.keys())}_dus_{ts}.json'),
                  'w') as f:
            json.dump(state, f)
        return state

    @classmethod
    def update(cls, dataunit, node, ts=0.):
        """Updates storage if given replica is newest"""

        if cls.replicas.get(dataunit, 0) < ts:
            cls.replicas[dataunit] = ts
            cls.storage[dataunit] = set()

        if isinstance(node, list):
            cls.storage[dataunit] |= set(node)
        else:
            cls.storage[dataunit].add(node)


class Node:
    """Simulation of database instance"""

    @classmethod
    async def read(cls, request):
        await asyncio.sleep(random.uniform(0.5, 5))
        print("READ")
        du = request.get('dataunit')
        nodes = Application.storage.get(du)

        if not nodes:
            print("!!!! NOT FOUND")
            return {'status': 404}
        random.choice(list(nodes))  # update with the time that load balance alg parent spends for finding node
        return {'time': AVERAGE_TIME_READ}

    @classmethod
    async def write(cls, request, ts=None):
        await asyncio.sleep(random.uniform(0.5, 5))
        if ts is not None:
            print("SPREAD")
        else:
            print("WRITE")

        du = request.get('dataunit')
        node = request.get('nodes', None) or random.randint(0, Application.nodes_number - 1)
        if ts is not None:
            print("nde")
        created_at = ts or time.time()
        Application.update(du, node, ts=created_at)
        return {'status': 201, 'created_at': created_at, 'time': AVERAGE_TIME_WRITE}

    @classmethod
    async def spread_replica(cls, nodes_number):
        # simulate returning neighbors nodes
        canidates_to_update = [d for d in Application.dataunits if len(Application.storage[d]) < AVAILABILITY_THRESHOLD]
        await cls.write({'dataunit': random.choice(canidates_to_update),
                         'nodes': random.sample([i for i in range(nodes_number)],
                                                GRAPH_DEGREE)},
                        ts=0)
