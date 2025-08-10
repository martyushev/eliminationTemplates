% initialize solver statistics
function stats = ini_stats(prob)

    stats = struct(...
        'name',prob,...    % problem name
        'solver','',...    % problem solver
        'tm',[],...        % timing
        'err',[],...       % numerical error
        'flr',[],...       % failure
        'shrp',[],...      % boundary sharpness
        'k',[],...         % number of roots
        'kr',[]);          % number of real roots

end