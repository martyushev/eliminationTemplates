import numpy as np

def disp_stats(stats):
    g = '30'  # gap
    print(f"{'Problem:':{g}s} {stats['name']:{g}s}")
    print(f"{'Ave. runtime (ms):':{g}s} {1000*np.mean(stats['tm']):{g}.2f}")
    print(f"{'Max. num. error:':{g}s} {max(stats['err']):{g}.2f}")
    print(f"{'Ave. num. error:':{g}s} {np.mean(stats['err']):{g}.2f}")
    print(f"{'Med. num. error:':{g}s} {np.median(stats['err']):{g}.2f}")
    print(f"{'Fails (%):':{g}s} {np.mean(stats['flr'])*100:{g}.1f}")
    print(f"{'Ave. sharpness:':{g}s} {np.mean(stats['shrp']):{g}.2f}")
    print(f"{'Med. sharpness:':{g}s} {np.median(stats['shrp']):{g}.2f}")
    print(f"{'Min. number of roots:':{g}s} {min(stats['k']):{g}d}")
    print(f"{'Max. number of real roots:':{g}s} {max(stats['kr']):{g}d}")
    print(f"{'Ave. number of real roots:':{g}s} {np.mean(stats['kr']):{g}.1f}")