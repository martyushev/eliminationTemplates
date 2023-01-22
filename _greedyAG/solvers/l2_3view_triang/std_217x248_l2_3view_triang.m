% Input: coefficient matrix C of size 8x25

function [x1,x2,x3,x4,x5,x6,x7,x8] = std_217x248_l2_3view_triang(C)

    i_dx = [1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,8,8,8,8,8,9,9,9,9,9,10,10,10,10,10,11,11,11,11,11,12,12,12,12,12,13,13,13,13,13,14,14,14,14,14,15,15,15,15,15,16,16,16,16,16,17,17,17,17,17,18,18,18,18,18,19,19,19,19,19,20,20,20,20,20,21,21,21,21,21,22,22,22,22,22,23,23,23,23,23,24,24,24,24,24,25,25,25,25,25,26,26,26,26,26,27,27,27,27,27,28,28,28,28,28,29,29,29,29,29,30,30,30,30,30,31,31,31,31,31,32,32,32,32,32,33,33,33,33,33,34,34,34,34,34,35,35,35,35,35,36,36,36,36,36,37,37,37,37,37,38,38,38,38,38,39,39,39,39,39,40,40,40,40,40,41,41,41,41,41,42,42,42,42,42,43,43,43,43,43,44,44,44,44,44,45,45,45,45,45,46,46,46,46,46,47,47,47,47,47,48,48,48,48,48,49,49,49,49,49,50,50,50,50,50,51,51,51,51,51,52,52,52,52,52,53,53,53,53,53,54,54,54,54,54,55,55,55,55,55,56,56,56,56,56,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,75,75,75,75,75,75,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,92,92,92,92,92,93,93,93,93,93,93,93,93,94,94,94,94,94,94,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,104,104,104,104,104,104,104,104,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,109,109,109,109,109,110,110,110,110,110,111,111,111,111,111,112,112,112,112,112,113,113,113,113,113,114,114,114,114,114,115,115,115,115,115,116,116,116,116,116,117,117,117,117,117,118,118,118,118,118,119,119,119,119,119,120,120,120,120,120,121,121,121,121,121,122,122,122,122,122,123,123,123,123,123,124,124,124,124,124,125,125,125,125,125,126,126,126,126,126,127,127,127,127,127,128,128,128,128,128,129,129,129,129,129,130,130,130,130,130,131,131,131,131,131,132,132,132,132,132,133,133,133,133,133,134,134,134,134,134,135,135,135,135,135,136,136,136,136,136,137,137,137,137,137,138,138,138,138,138,139,139,139,139,139,140,140,140,140,140,141,141,141,141,141,142,142,142,142,142,143,143,143,143,143,144,144,144,144,144,145,145,145,145,145,146,146,146,146,146,147,147,147,147,147,148,148,148,148,148,149,149,149,149,149,150,150,150,150,150,151,151,151,151,151,152,152,152,152,152,153,153,153,153,153,154,154,154,154,154,155,155,155,155,155,156,156,156,156,156,157,157,157,157,157,158,158,158,158,158,159,159,159,159,159,160,160,160,160,160,161,161,161,161,161,162,162,162,162,162,163,163,163,163,163,164,164,164,164,164,165,165,165,165,165,166,166,166,166,166,167,167,167,167,167,168,168,168,168,168,169,169,169,169,169,170,170,170,170,170,171,171,171,171,171,172,172,172,172,172,172,172,172,173,173,173,173,173,173,173,173,173,174,174,174,174,174,174,174,174,174,175,175,175,175,175,175,175,176,176,176,176,176,176,176,177,177,177,177,177,177,177,177,177,178,178,178,178,178,178,178,178,178,179,179,179,179,179,179,179,179,179,180,180,180,180,180,180,180,180,180,181,181,181,181,181,181,181,181,181,182,182,182,182,182,182,182,182,182,183,183,183,183,183,183,183,183,183,184,184,184,184,184,184,184,184,185,185,185,185,185,185,185,185,185,186,186,186,186,186,186,186,186,186,187,187,187,187,187,187,188,188,188,188,188,188,188,188,189,189,189,189,189,189,189,189,189,190,190,190,190,190,190,190,190,190,191,191,191,191,191,191,191,191,191,192,192,192,192,192,192,192,192,192,193,193,193,193,193,193,193,193,193,194,194,194,194,194,194,194,194,194,195,195,195,195,195,195,195,195,195,196,196,196,196,196,196,196,196,196,197,197,197,197,197,197,197,197,197,198,198,198,198,198,198,198,198,198,199,199,199,199,199,199,199,199,200,200,200,200,200,200,200,200,200,201,201,201,201,201,201,201,201,201,202,202,202,202,202,202,202,203,203,203,203,203,203,203,203,203,204,204,204,204,204,204,204,204,204,205,205,205,205,205,205,205,205,205,206,206,206,206,206,206,206,206,206,207,207,207,207,207,207,207,207,207,208,208,208,208,208,208,208,208,208,209,209,209,209,209,209,209,209,209,210,210,210,210,210,210,210,210,211,211,211,211,211,211,212,212,212,212,212,212,212,212,212,213,213,213,213,213,213,213,213,213,214,214,214,214,214,214,214,214,214,215,215,215,215,215,215,215,215,215,216,216,216,216,216,216,216,216,216,217,217,217,217,217,217];
    j_dx = [186,187,238,243,248,140,143,186,230,247,143,144,177,187,245,156,157,184,224,243,139,142,176,185,236,147,148,179,223,242,151,152,222,229,246,170,171,208,213,241,4,6,28,48,114,104,105,168,194,213,44,48,110,139,226,48,51,112,142,178,56,59,120,147,235,62,65,127,151,240,52,53,115,144,233,45,49,140,218,244,67,69,137,155,185,100,101,163,193,212,102,103,192,199,216,94,97,160,169,206,6,8,29,51,116,61,64,126,150,220,49,52,113,143,239,55,58,119,146,180,70,71,145,158,223,72,73,149,159,229,95,98,170,200,217,2,4,27,44,111,186,187,236,243,248,138,141,176,184,238,140,143,186,226,247,143,144,178,187,245,156,157,185,224,243,147,148,180,223,242,151,152,220,229,246,170,171,206,213,241,3,5,28,47,113,104,105,169,194,213,43,47,110,138,230,47,50,112,141,177,56,59,121,147,235,62,65,128,151,240,52,53,116,144,233,45,49,111,140,244,66,68,137,154,184,100,101,164,193,212,102,103,190,199,216,1,3,27,43,218,93,96,160,168,208,5,7,29,50,115,60,63,126,149,222,54,57,119,145,179,49,52,114,143,239,70,71,146,158,223,72,73,150,159,229,95,98,170,196,217,184,185,212,216,241,243,247,248,136,137,163,184,192,208,230,238,138,139,186,205,210,217,244,247,141,142,165,167,187,215,239,245,154,155,186,193,199,213,224,243,145,146,166,198,212,223,235,242,149,150,198,204,216,229,240,246,168,169,174,175,211,213,217,241,40,41,79,86,138,200,218,230,41,42,80,111,139,196,226,54,55,84,89,147,205,225,235,60,61,89,91,151,210,232,240,57,58,85,90,124,148,165,181,63,64,90,92,130,152,167,183,7,8,18,22,31,53,78,118,50,51,83,88,117,144,203,233,43,44,140,195,202,214,237,244,3,4,16,20,49,201,219,231,11,23,62,202,221,232,66,67,100,102,140,156,170,186,5,6,17,21,30,52,77,117,68,69,101,103,143,157,171,187,47,48,82,87,143,209,231,239,93,94,106,108,170,172,214,217,96,97,107,109,171,173,209,215,1,2,15,45,191,207,227,237,9,19,23,32,56,195,225,184,185,212,216,241,243,245,248,136,137,163,177,184,192,208,238,138,139,186,205,210,217,239,247,141,142,165,167,187,215,233,245,154,155,187,193,199,213,224,243,145,146,166,181,198,212,223,242,149,150,183,198,204,216,229,246,168,169,174,175,211,213,215,241,12,36,65,87,130,40,41,79,86,113,138,200,230,46,81,115,141,161,177,41,42,80,114,139,196,226,54,55,84,89,124,147,205,235,60,61,89,91,130,151,210,240,57,58,85,90,125,148,165,181,63,64,90,92,131,152,167,183,50,51,83,88,118,144,203,233,43,44,140,195,202,214,231,244,3,4,16,20,30,49,201,231,66,67,100,102,143,156,170,186,5,6,17,21,31,52,77,117,47,48,82,87,117,143,209,239,93,94,106,108,170,172,209,217,96,97,107,109,171,173,203,215,1,2,15,45,191,207,219,237,10,34,59,82,124,215,217,241,242,248,161,179,200,208,238,209,214,217,235,247,181,203,209,215,245,170,171,213,223,243,162,180,196,206,236,165,182,205,212,242,167,210,216,228,246,172,173,211,212,241,20,21,38,87,130,75,120,188,200,230,74,76,121,196,226,104,105,158,194,224,24,25,56,95,140,25,26,59,98,143,87,132,202,210,240,87,88,133,167,183,91,92,135,204,234,77,78,125,203,233,201,207,214,225,244,93,96,145,168,184,94,97,146,169,185,13,33,189,201,231,20,37,191,202,232,95,98,147,170,186,13,14,34,77,117,98,99,148,171,187,77,124,201,209,239,89,90,134,198,228,21,22,39,88,131,102,103,153,199,229,32,189,197,207,237,215,217,241,246,248,161,200,208,222,238,209,214,217,240,247,183,203,209,215,245,170,171,213,229,243,162,196,206,220,236,165,205,212,228,242,167,210,216,234,246,172,173,211,216,241,75,127,188,200,230,74,76,128,196,226,104,105,159,194,224,24,25,62,95,140,25,26,65,98,143,82,132,195,205,235,82,83,133,165,181,84,85,134,166,182,77,78,131,203,233,201,207,214,232,244,93,96,149,168,184,94,97,150,169,185,13,35,189,201,231,13,14,36,77,117,77,130,201,209,239,89,90,135,198,228,17,18,39,83,125,100,101,153,193,223,189,197,207,221,237,15,16,37,195,225,16,17,38,82,124,40,41,46,136,137,138,141,184,1,2,3,4,43,44,45,49,140,3,4,5,6,47,48,49,52,143,9,10,54,55,56,59,147,11,12,60,61,62,65,151,43,44,47,48,138,139,140,143,186,74,75,76,188,196,200,209,214,217,111,113,114,218,226,230,239,244,247,5,6,7,8,50,51,52,53,144,47,48,50,51,141,142,143,144,187,113,114,115,116,177,178,233,239,245,54,55,57,58,145,146,147,148,223,79,80,81,163,164,165,205,212,120,121,122,123,179,180,181,235,242,60,61,63,64,149,150,151,152,229,86,167,190,192,210,216,127,128,129,183,220,222,240,246,66,67,68,69,154,155,156,157,224,93,94,96,97,168,169,170,171,213,138,139,141,142,184,185,186,187,243,161,162,196,200,206,208,215,217,241,177,178,226,230,236,238,245,247,248,181,183,235,240,242,245,246,247,248,120,122,127,129,177,179,222,230,238,124,130,225,232,235,239,240,244,247,124,125,130,131,181,183,233,239,245,147,148,151,152,186,187,223,229,243,121,123,128,178,180,220,226,236,165,167,205,210,212,215,216,217,241,16,17,20,21,77,82,87,201,209,19,23,82,84,89,195,205,100,101,102,103,170,171,193,199,213,106,107,108,109,172,173,174,175,211,70,71,72,73,156,157,158,159,224,32,33,35,221,225,231,232,237,244,84,85,89,90,165,166,198,205,212,89,90,91,92,167,198,204,210,216,15,16,20,191,195,201,202,207,214,79,81,86,161,163,192,200,208,80,162,164,190,196,206,56,59,62,65,140,143,147,151,186,33,34,35,36,117,124,130,231,239,82,87,195,202,205,209,210,214,217,82,83,87,88,165,167,203,209,215,17,18,21,22,77,78,83,88,203,23,87,89,91,202,210];
    C_dx = [81,89,129,177,193,81,89,177,129,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,177,129,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,129,177,193,81,89,177,129,193,81,89,129,177,193,82,90,138,178,194,82,90,138,178,194,82,90,178,138,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,138,178,194,82,90,178,138,194,67,75,115,123,187,179,147,195,67,75,115,179,123,187,147,195,67,75,179,115,123,187,147,195,67,75,115,123,179,187,147,195,67,75,147,115,123,187,179,195,67,75,115,123,187,179,147,195,67,75,115,123,187,179,147,195,67,75,115,123,187,179,147,195,67,75,115,123,179,187,147,195,67,75,115,147,179,187,195,67,75,115,123,179,187,147,195,67,75,115,123,179,187,147,195,67,75,115,123,147,179,187,195,67,75,115,123,147,179,187,195,67,75,115,123,147,179,187,195,67,75,115,123,147,179,187,195,67,75,179,115,123,187,147,195,67,75,115,123,179,187,147,195,67,115,179,187,147,195,67,75,115,123,147,179,187,195,67,75,115,123,147,179,187,195,67,75,115,123,147,179,187,195,67,75,115,123,179,187,147,195,67,75,115,123,179,187,147,195,67,75,115,123,179,187,147,195,67,75,115,179,123,187,147,195,67,115,123,147,179,187,195,68,76,116,124,188,180,156,196,68,76,116,156,180,124,188,196,68,76,180,116,124,188,156,196,68,76,116,124,180,188,156,196,68,76,156,116,124,188,180,196,68,76,116,156,124,188,180,196,68,76,156,116,124,188,180,196,68,76,116,124,188,180,156,196,68,156,180,188,196,68,76,116,124,156,180,188,196,68,116,156,180,188,196,68,76,116,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,180,116,124,188,156,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,156,180,188,196,68,76,116,124,180,188,156,196,68,76,116,124,180,188,156,196,68,76,116,180,124,188,156,196,68,156,180,188,196,109,101,189,165,197,109,165,101,189,197,109,101,189,165,197,165,109,101,189,197,101,109,189,165,197,109,165,101,189,197,109,165,101,189,197,109,101,189,165,197,101,109,189,165,197,101,109,165,189,197,109,165,101,189,197,101,109,165,189,197,101,109,165,189,197,101,109,165,189,197,101,109,165,189,197,109,165,101,189,197,101,109,165,189,197,101,109,165,189,197,101,109,165,189,197,109,101,189,165,197,101,109,165,189,197,101,109,165,189,197,109,165,101,189,197,109,165,101,189,197,101,109,165,189,197,101,109,165,189,197,101,109,165,189,197,109,165,101,189,197,101,109,165,189,197,101,109,165,189,197,101,109,165,189,197,165,109,101,189,197,110,102,190,174,198,110,102,190,174,198,110,102,190,174,198,174,110,102,190,198,102,110,190,174,198,110,102,190,174,198,110,102,190,174,198,110,102,190,174,198,102,110,190,174,198,110,174,102,190,198,102,110,174,190,198,102,110,174,190,198,102,110,174,190,198,102,110,174,190,198,110,174,102,190,198,102,110,174,190,198,102,110,174,190,198,102,110,174,190,198,110,102,190,174,198,102,110,174,190,198,102,110,174,190,198,110,174,102,190,198,102,110,174,190,198,110,174,102,190,198,102,110,174,190,198,102,110,174,190,198,102,110,174,190,198,110,102,190,174,198,102,110,174,190,198,102,110,174,190,198,7,15,23,135,143,151,159,199,7,15,23,31,135,143,151,159,199,7,15,23,31,135,143,151,159,199,7,23,135,143,151,159,199,7,23,135,143,151,159,199,7,15,23,31,135,143,151,159,199,15,23,31,7,143,135,159,151,199,15,23,31,7,143,135,159,151,199,7,15,23,31,135,143,151,159,199,7,15,23,31,135,143,151,159,199,7,15,23,31,135,143,159,151,199,7,15,23,31,135,143,151,159,199,7,15,23,135,143,159,151,199,7,15,23,31,135,143,159,151,199,7,15,23,31,135,143,151,159,199,7,159,143,135,151,199,7,15,23,159,143,135,151,199,7,15,23,31,135,143,151,159,199,7,15,23,31,135,143,151,159,199,7,15,23,31,135,143,151,159,199,23,31,15,7,143,135,159,151,199,23,31,15,7,143,135,159,151,199,48,64,40,56,168,160,176,152,200,40,48,56,64,160,168,176,152,200,48,64,40,56,168,160,176,152,200,40,48,56,64,168,176,160,152,200,40,48,56,64,152,160,168,176,200,40,48,56,160,168,176,152,200,48,64,40,56,168,160,176,152,200,40,48,56,64,160,168,176,152,200,40,56,160,168,176,152,200,40,48,56,64,152,160,168,176,200,40,48,56,64,152,160,168,176,200,40,48,56,64,152,160,168,176,200,40,48,64,56,168,160,176,152,200,40,48,56,64,160,168,176,152,200,40,48,56,64,160,168,176,152,200,40,48,64,56,168,160,176,152,200,40,48,56,160,168,176,152,200,40,160,168,176,152,200,40,48,56,64,152,160,168,176,200,40,48,56,64,160,168,176,152,200,48,64,40,56,168,160,176,152,200,40,48,56,64,168,176,160,152,200,40,48,56,64,152,160,168,176,200,40,160,168,176,152,200];
    M = sparse(i_dx,j_dx,C(C_dx),217,248);

    [L,~,Pi] = lu(M(:,1:187));
    Pi = Pi';
    M = [Pi*L Pi(:,188:end)]\M(:,188:end);
    M = M(end-29:end,:);

    T = zeros(31);
    T(1:30,:) = -M(:,1:30)\M(:,31:end);
    T(744) = 1;

    [V,D] = eig(T);
    sol = [V([21,19,30,28,25,29,26],:)./repmat(V(31,:),7,1); diag(D).'];

    I = find(not(isnan(sol(1,:))) & not(isinf(sol(1,:))));
    %I = I(not(imag(sol(1,:)))); % uncomment this line for real roots only
    x1 = sol(1,I);
    x2 = sol(2,I);
    x3 = sol(3,I);
    x4 = sol(4,I);
    x5 = sol(5,I);
    x6 = sol(6,I);
    x7 = sol(7,I);
    x8 = sol(8,I);

end