#from backports import configparser
import configparser
import os


CONFIGFILE = os.path.join(os.getcwd(),'conf/datastore.ini')
CONF = None


def getconfig():
    CONF = configparser.RawConfigParser()
    return CONF


def parameter(section, param):
    config = CONF or getconfig()
    config.read(CONFIGFILE)
    return config.get(section, param)
