from backports import configparser


CONFIGFILE = 'conf/datastore.conf'
CONF = None


def getconfig():
    CONF = configparser.ConfigParser()
    CONF.read(CONFIGFILE)
    return CONF


def parameter(section, param):
    config = CONF or getconfig()
    return config.get(section, param)
