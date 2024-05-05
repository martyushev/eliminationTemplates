# initialize solver statistics
def ini_stats(prob):
    return {
        'name': prob,   # problem name
        'tm': [],       # timing
        'err': [],      # numerical error
        'flr': [],      # failure
        'shrp': [],     # boundary sharpness
        'k': [],        # number of roots
        'kr': []        # number of real roots
    }