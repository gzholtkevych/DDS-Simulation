from uuid import uuid1


class Dataunit(object):

    def __init__(self, incremental_id):
        self.fields = {'id', 'uuid', 'data'}
        self.id = incremental_id

        # uuid of the dataunit located on the special node
        self.uuid = uuid1()
        self.data = '{uuid}_some data message'.format(self.uuid)

    def to_dict(self):
        return dict((k, getattr(k)) for k in self.fields)
