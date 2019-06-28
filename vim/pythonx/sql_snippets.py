def get_capitals(string):
    capitals = [c for c in string if c.isupper()]
    return ''.join(capitals)
def get_dbo_abbreviation(string):
    dboName = string.split('.')[-1]
    if len(dboName) is 0:
        return ''
    capitals = get_capitals(dboName)
    return capitals.lower() if len(capitals) is not 0 else dboName[0]
