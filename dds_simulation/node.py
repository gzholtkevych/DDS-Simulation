
class Node(object):

    def run(self):
        """
        listen to requests from client
        once a request came send it to process as asynchronous task

        task:
        send task to update to others neighbors
        if this dataunit exists on this node,
        block on this dataunit while it updates dataunit
        """
        pass

    def put(self):
        # updates dataunit
        pass

    def post(self):
        # insert new dataunit depending on the request
        pass

    def get(self):
        # find appropriate dataunit
        pass
