% Input: coefficient matrix C of size 16x36

% Monomial vector: [u^5, u^4*v, u^3*v^2, u^4*w, v^3*w*u, w^2*v^3, u*v*w^3, v^2*w^3, u*w^4, w^4*v, w^5, u^4, u^3*v, u^2*v^2, u*v^3, u^3*w, u^2*v*w, u*v^2*w, w^3*v, w^4, u^3, v*u^2, v^2*u, v^3, u^2*w, u*v*w, w*v^2, u^2, v*u, v^2, u*w, w*v, u, v, w, 1]

function [u, v, w] = std_4pra_colpiv_sprs(C)

    i_dx = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16];
    j_dx = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 33, 34, 35, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 33, 34, 35, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 33, 34, 35, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 33, 34, 35, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    C_dx = [65, 81, 113, 145, 161, 1, 17, 33, 49, 97, 129, 225, 257, 273, 177, 193, 209, 241, 321, 337, 353, 369, 385, 401, 417, 433, 449, 481, 513, 529, 545, 66, 82, 114, 146, 162, 2, 18, 34, 50, 98, 130, 226, 258, 274, 178, 194, 210, 290, 306, 322, 338, 354, 370, 386, 402, 418, 434, 450, 466, 498, 514, 530, 546, 562, 67, 83, 115, 147, 163, 3, 35, 51, 99, 131, 227, 259, 275, 179, 195, 211, 243, 291, 307, 323, 339, 355, 371, 387, 403, 419, 435, 451, 467, 483, 499, 515, 531, 547, 563, 228, 260, 276, 180, 196, 212, 244, 292, 308, 324, 340, 356, 372, 388, 404, 420, 436, 452, 468, 484, 500, 516, 532, 548, 564, 69, 85, 117, 149, 165, 5, 21, 37, 53, 101, 133, 229, 261, 277, 181, 197, 213, 245, 325, 341, 357, 373, 389, 405, 421, 437, 453, 485, 517, 533, 549, 70, 86, 118, 150, 166, 6, 22, 38, 54, 102, 134, 230, 262, 278, 182, 198, 214, 294, 310, 326, 342, 358, 374, 390, 406, 422, 438, 454, 470, 502, 518, 534, 550, 566, 71, 87, 119, 151, 167, 7, 39, 55, 103, 135, 231, 263, 279, 183, 199, 215, 247, 295, 311, 327, 343, 359, 375, 391, 407, 423, 439, 455, 471, 487, 503, 519, 535, 551, 567, 232, 264, 280, 184, 200, 216, 248, 296, 312, 328, 344, 360, 376, 392, 408, 424, 440, 456, 472, 488, 504, 520, 536, 552, 568, 73, 89, 121, 153, 169, 9, 25, 41, 57, 105, 137, 233, 265, 281, 185, 201, 217, 249, 329, 345, 361, 377, 393, 409, 425, 441, 457, 489, 521, 537, 553, 74, 90, 122, 154, 170, 10, 26, 42, 58, 106, 138, 234, 266, 282, 186, 202, 218, 298, 314, 330, 346, 362, 378, 394, 410, 426, 442, 458, 474, 506, 522, 538, 554, 570, 75, 91, 123, 155, 171, 11, 43, 59, 107, 139, 235, 267, 283, 187, 203, 219, 251, 299, 315, 331, 347, 363, 379, 395, 411, 427, 443, 459, 475, 491, 507, 523, 539, 555, 571, 236, 268, 284, 188, 204, 220, 252, 300, 316, 332, 348, 364, 380, 396, 412, 428, 444, 460, 476, 492, 508, 524, 540, 556, 572, 77, 93, 125, 157, 173, 13, 29, 45, 61, 109, 141, 237, 269, 285, 189, 205, 221, 253, 333, 349, 365, 381, 397, 413, 429, 445, 461, 493, 525, 541, 557, 78, 94, 126, 158, 174, 14, 30, 46, 62, 110, 142, 238, 270, 286, 190, 206, 222, 302, 318, 334, 350, 366, 382, 398, 414, 430, 446, 462, 478, 510, 526, 542, 558, 574, 79, 95, 127, 159, 175, 15, 47, 63, 111, 143, 239, 271, 287, 191, 207, 223, 255, 303, 319, 335, 351, 367, 383, 399, 415, 431, 447, 463, 479, 495, 511, 527, 543, 559, 575, 240, 272, 288, 192, 208, 224, 256, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496, 512, 528, 544, 560, 576];
    M = full(sparse(i_dx,j_dx,C(C_dx),16,36));

    [L,~,Pi] = lu(M(:,1:5));
    Pi = Pi';
    M = [Pi*L Pi(:,6:end)]\M(:,6:end);
    M = M(6:end,:);

    [L,UR,Pi] = lu(M(:,1:9));
    Pi = Pi';
    M = [Pi*L Pi(:,10:end)]\M(:,10:end);
    MP = M(1:9,:);
    NP = M(10:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-4));
    A = UR\[MP(:,1:end-4)*Pi MP(:,end-3:end)];
    B = U(:,1:2)\[U(:,3:end) Q'*NP(:,end-3:end)];
    M = [-A(:,end-19:end)+A(:,1:end-20)*B; -B];

    xP = [23, 24, 25, 26, 27, 28, 1, 2, 3, 29, 4, 30, 31, 7, 8, 9, 11, 12, 14, 15, 17, 19];
    P1 = [(1:18)*Pi 19:22];
    T = getT(M,[23:31 P1(1:end-20)],P1(end-19:end),xP);

    [V,D] = eig(T);
    sol = [V(18:19,:)./repmat(V(20,:),2,1); diag(D).'];

    I = find(not(isnan(sol(1,:))));
    %I = find(not(isnan(sol(1,:))) & not(imag(sol(1,:))));
    v = sol(1,I);
    w = sol(2,I);
    u = sol(3,I);

end