function file=zigzag16(T);
file=[T(1,1) T(1,2) T(2,1) T(3,1) T(2,2) T(1,3) T(1,4) T(2,3) T(3,2) T(4,1) T(5,1) T(4,2) T(3,3) T(2,4) T(1,5) T(1,6) T(2,5) T(3,4) T(4,3) T(5,2) ...
	T(6,1) T(7,1) T(6,2) T(5,3) T(4,4) T(3,5) T(2,6) T(1,7) T(1,8) T(2,7) T(3,6) T(4,5) T(5,4) T(6,3) T(7,2) T(8,1) T(9,1) T(8,2) T(7,3) T(6,4) ...
    T(5,5) T(4,6) T(3,7) T(2,8) T(1,9) T(1,10) T(2,9) T(3,8) T(4,7) T(5,6) T(6,5) T(7,4) T(8,3) T(9,2) T(10,1) T(11,1) T(10,2) T(9,3) T(8,4) T(7,5) ...
	T(6,6) T(5,7) T(4,8) T(3,9) T(2,10) T(1,11) T(1,12) T(2,11) T(3,10) T(4,9) T(5,8) T(6,7) T(7,6) T(8,5) T(9,4) T(10,3) T(11,2) T(12,1) T(13,1) T(12,2) ...
	T(11,3) T(10,4) T(9,5) T(8,6) T(7,7) T(6,8) T(5,9) T(4,10) T(3,11) T(2,12) T(1,13) T(1,14) T(2,13) T(3,12) T(4,11) T(5,10) T(6,9) T(7,8) T(8,7) T(9,6) ...
	T(10,5) T(11,4) T(12,3) T(13,2) T(14,1) T(15,1) T(14,2) T(13,3) T(12,4) T(11,5) T(10,6) T(9,7) T(8,8) T(7,9) T(6,10) T(5,11) T(4,12) T(3,13) T(2,14) T(1,15) ...
	T(1,16) T(2,15) T(3,14) T(4,13) T(5,12) T(6,11) T(7,10) T(8,9) T(9,8) T(10,7) T(11,6) T(12,5) T(13,4) T(14,3) T(15,2) T(16,1) T(17,1) T(16,2) T(15,3) T(14,4) ...
    T(13,5) T(12,6) T(11,7) T(10,8) T(9,9) T(8,10) T(7,11) T(6,12) T(5,13) T(4,14) T(3,15) T(2,16) T(1,17) T(1,18) T(2,17) T(3,16) T(4,15) T(5,14) T(6,13) T(7,12) ...
	T(8,11) T(9,10) T(10,9) T(11,8) T(12,7) T(13,6) T(14,5) T(15,4) T(16,3) T(17,2) T(18,1) T(19,1) T(18,2) T(17,3) T(16,4) T(15,5) T(14,6) T(13,7) T(12,8) T(11,9) ...
	T(10,10) T(9,11) T(8,12) T(7,13) T(6,14) T(5,15) T(4,16) T(3,17) T(2,18) T(1,19) T(1,20) T(2,19) T(3,18) T(4,17) T(5,16) T(6,15) T(7,14) T(8,13) T(9,12) T(10,11) ...
	T(11,10) T(12,9) T(13,8) T(14,7) T(15,6) T(16,5) T(17,4) T(18,3) T(19,2) T(20,1) T(21,1) T(20,2) T(19,3) T(18,4) T(17,5) T(16,6) T(15,7) T(14,8) T(13,9) T(12,10) ...
    T(11,11) T(10,12) T(9,13) T(8,14) T(7,15) T(6,16) T(5,17) T(4,18) T(3,19) T(2,20) T(1,21) T(1,22) T(2,21) T(3,20) T(4,19) T(5,18) T(6,17) T(7,16) T(8,15) T(9,14) ...
    T(10,13) T(11,12) T(12,11) T(13,10) T(14,9) T(15,8) T(16,7) T(17,6) T(18,5) T(19,4) T(20,3) T(21,2) T(22,1) T(23,1) T(22,2) T(21,3) T(20,4) T(19,5) T(18,6) T(17,7) ...
	T(16,8) T(15,9) T(14,10) T(13,11) T(12,12) T(11,13) T(10,14) T(9,15) T(8,16) T(7,17) T(6,18) T(5,19) T(4,20) T(3,21) T(2,22) T(1,23) T(1,24) T(2,23) T(3,22) T(4,21) ...
    T(5,20) T(6,19) T(7,18) T(8,17) T(9,16) T(10,15) T(11,14) T(12,13) T(13,12) T(14,11) T(15,10) T(16,9) T(17,8) T(18,7) T(19,6) T(20,5) T(21,4) T(22,3) T(23,2) T(24,1) ...
	T(25,1) T(24,2) T(23,3) T(22,4) T(21,5) T(20,6) T(19,7) T(18,8) T(17,9) T(16,10) T(15,11) T(14,12) T(13,13) T(12,14) T(11,15) T(10,16) T(9,17) T(8,18) T(7,19) T(6,20) ...
	T(5,21) T(4,22) T(3,23) T(2,24) T(1,25) T(1,26) T(2,25) T(3,24) T(4,23) T(5,22) T(6,21) T(7,20) T(8,19) T(9,18) T(10,17) T(11,16) T(12,15) T(13,14) T(14,13) T(15,12) ...
	T(16,11) T(17,10) T(18,9) T(19,8) T(20,7) T(21,6) T(22,5) T(23,4) T(24,3) T(25,2) T(26,1) T(27,1) T(26,2) T(25,3) T(24,4) T(23,5) T(22,6) T(21,7) T(20,8) T(19,9) ...
	T(18,10) T(17,11) T(16,12) T(15,13) T(14,14) T(13,15) T(12,16) T(11,17) T(10,18) T(9,19) T(8,20) T(7,21) T(6,22) T(5,23) T(4,24) T(3,25) T(2,26) T(1,27) T(1,28) T(2,27) ...
    T(3,26) T(4,25) T(5,24) T(6,23) T(7,22) T(8,21) T(9,20) T(10,19) T(11,18) T(12,17) T(13,16) T(14,15) T(15,14) T(16,13) T(17,12) T(18,11) T(19,10) T(20,9) T(21,8) T(22,7) ...
	T(23,6) T(24,5) T(25,4) T(26,3) T(27,2) T(28,1) T(29,1) T(28,2) T(27,3) T(26,4) T(25,5) T(24,6) T(23,7) T(22,8) T(21,9) T(20,10) T(19,11) T(18,12) T(17,13) T(16,14) ...
	T(15,15) T(14,16) T(13,17) T(12,18) T(11,19) T(10,20) T(9,21) T(8,22) T(7,23) T(6,24) T(5,25) T(4,26) T(3,27) T(2,28) T(1,29) T(1,30) T(2,29) T(3,28) T(4,27) T(5,26) ...
	T(6,25) T(7,24) T(8,23) T(9,22) T(10,21) T(11,20) T(12,19) T(13,18) T(14,17) T(15,16) T(16,15) T(17,14) T(18,13) T(19,12) T(20,11) T(21,10) T(22,9) T(23,8) T(24,7) T(25,6) ...
    T(26,5) T(27,4) T(28,3) T(29,2) T(30,1) T(31,1) T(30,2) T(29,3) T(28,4) T(27,5) T(26,6) T(25,7) T(24,8) T(23,9) T(22,10) T(21,11) T(20,12) T(19,13) T(18,14) T(17,15) ...
    T(16,16) T(15,17) T(14,18) T(13,19) T(12,20) T(11,21) T(10,22) T(9,23) T(8,24) T(7,25) T(6,26) T(5,27) T(4,28) T(3,29) T(2,30) T(1,31) T(1,32) T(2,31) T(3,30) T(4,29) ...
	T(5,28) T(6,27) T(7,26) T(8,25) T(9,24) T(10,23) T(11,22) T(12,21) T(13,20) T(14,19) T(15,18) T(16,17) T(17,16) T(18,15) T(19,14) T(20,13) T(21,12) T(22,11) T(23,10) T(24,9) ...
    T(25,8) T(26,7) T(27,6) T(28,5) T(29,4) T(30,3) T(31,2) T(32,1) T(32,2) T(31,3) T(30,4) T(29,5) T(28,6) T(27,7) T(26,8) T(25,9) T(24,10) T(23,11) T(22,12) T(21,13) ...
	T(20,14) T(19,15) T(18,16) T(17,17) T(16,18) T(15,19) T(14,20) T(13,21) T(12,22) T(11,23) T(10,24) T(9,25) T(8,26) T(7,27) T(6,28) T(5,29) T(4,30) T(3,31) T(2,32) T(3,32) ...
	T(4,31) T(5,30) T(6,29) T(7,28) T(8,27) T(9,26) T(10,25) T(11,24) T(12,23) T(13,22) T(14,21) T(15,20) T(16,19) T(17,18) T(18,17) T(19,16) T(20,15) T(21,14) T(22,13) T(23,12) ...
	T(24,11) T(25,10) T(26,9) T(27,8) T(28,7) T(29,6) T(30,5) T(31,4) T(32,3) T(32,4) T(31,5) T(30,6) T(29,7) T(28,8) T(27,9) T(26,10) T(25,11) T(24,12) T(23,13) T(22,14) ...
	T(21,15) T(20,16) T(19,17) T(18,18) T(17,19) T(16,20) T(15,21) T(14,22) T(13,23) T(12,24) T(11,25) T(10,26) T(9,27) T(8,28) T(7,29) T(6,30) T(5,31) T(4,32) T(5,32) T(6,31) ...
    T(7,30) T(8,29) T(9,28) T(10,27) T(11,26) T(12,25) T(13,24) T(14,23) T(15,22) T(16,21) T(17,20) T(18,19) T(19,18) T(20,17) T(21,16) T(22,15) T(23,14) T(24,13) T(25,12) T(26,11) ...
	T(27,10) T(28,9) T(29,8) T(30,7) T(31,6) T(32,5) T(32,6) T(31,7) T(30,8) T(29,9) T(28,10) T(27,11) T(26,12) T(25,13) T(24,14) T(23,15) T(22,16) T(21,17) T(20,18) T(19,19) ...
	T(18,20) T(17,21) T(16,22) T(15,23) T(14,24) T(13,25) T(12,26) T(11,27) T(10,28) T(9,29) T(8,30) T(7,31) T(6,32) T(7,32) T(8,31) T(9,30) T(10,29) T(11,28) T(12,27) T(13,26) ...
	T(14,25) T(15,24) T(16,23) T(17,22) T(18,21) T(19,20) T(20,19) T(21,18) T(22,17) T(23,16) T(24,15) T(25,14) T(26,13) T(27,12) T(28,11) T(29,10) T(30,9) T(31,8) T(32,7) T(32,8) ...
    T(31,9) T(30,10) T(29,11) T(28,12) T(27,13) T(26,14) T(25,15) T(24,16) T(23,17) T(22,18) T(21,19) T(20,20) T(19,21) T(18,22) T(17,23) T(16,24) T(15,25) T(14,26) T(13,27) T(12,28) ...
    T(11,29) T(10,30) T(9,31) T(8,32) T(9,32) T(10,31) T(11,30) T(12,29) T(13,28) T(14,27) T(15,26) T(16,25) T(17,24) T(18,23) T(19,22) T(20,21) T(21,20) T(22,19) T(23,18) T(24,17) ...
	T(25,16) T(26,15) T(27,14) T(28,13) T(29,12) T(30,11) T(31,10) T(32,9) T(32,10) T(31,11) T(30,12) T(29,13) T(28,14) T(27,15) T(26,16) T(25,17) T(24,18) T(23,19) T(22,20) T(21,21) ...
    T(20,22) T(19,23) T(18,24) T(17,25) T(16,26) T(15,27) T(14,28) T(13,29) T(12,30) T(11,31) T(10,32) T(11,32) T(12,31) T(13,30) T(14,29) T(15,28) T(16,27) T(17,26) T(18,25) T(19,24) ...
	T(20,23) T(21,22) T(22,21) T(23,20) T(24,19) T(25,18) T(26,17) T(27,16) T(28,15) T(29,14) T(30,13) T(31,12) T(32,11) T(32,12) T(31,13) T(30,14) T(29,15) T(28,16) T(27,17) T(26,18) ...
	T(25,19) T(24,20) T(23,21) T(22,22) T(21,23) T(20,24) T(19,25) T(18,26) T(17,27) T(16,28) T(15,29) T(14,30) T(13,31) T(12,32) T(13,32) T(14,31) T(15,30) T(16,29) T(17,28) T(18,27) ...
	T(19,26) T(20,25) T(21,24) T(22,23) T(23,22) T(24,21) T(25,20) T(26,19) T(27,18) T(28,17) T(29,16) T(30,15) T(31,14) T(32,13) T(32,14) T(31,15) T(30,16) T(29,17) T(28,18) T(27,19) ...
	T(26,20) T(25,21) T(24,22) T(23,23) T(22,24) T(21,25) T(20,26) T(19,27) T(18,28) T(17,29) T(16,30) T(15,31) T(14,32) T(15,32) T(16,31) T(17,30) T(18,29) T(19,28) T(20,27) T(21,26) ...
    T(22,25) T(23,24) T(24,23) T(25,22) T(26,21) T(27,20) T(28,19) T(29,18) T(30,17) T(31,16) T(32,15) T(32,16) T(31,17) T(30,18) T(29,19) T(28,20) T(27,21) T(26,22) T(25,23) T(24,24) ...
	T(23,25) T(22,26) T(21,27) T(20,28) T(19,29) T(18,30) T(17,31) T(16,32) T(17,32) T(18,31) T(19,30) T(20,29) T(21,28) T(22,27) T(23,26) T(24,25) T(25,24) T(26,23) T(27,22) T(28,21) ...
	T(29,20) T(30,19) T(31,18) T(32,17) T(32,18) T(31,19) T(30,20) T(29,21) T(28,22) T(27,23) T(26,24) T(25,25) T(24,26) T(23,27) T(22,28) T(21,29) T(20,30) T(19,31) T(18,32) T(19,32) ...
	T(20,31) T(21,30) T(22,29) T(23,28) T(24,27) T(25,26) T(26,25) T(27,24) T(28,23) T(29,22) T(30,21) T(31,20) T(32,19) T(32,20) T(31,21) T(30,22) T(29,23) T(28,24) T(27,25) T(26,26) ...
    T(25,27) T(24,28) T(23,29) T(22,30) T(21,31) T(20,32) T(21,32) T(22,31) T(23,30) T(24,29) T(25,28) T(26,27) T(27,26) T(28,25) T(29,24) T(30,23) T(31,22) T(32,21) T(32,22) T(31,23) ...
    T(30,24) T(29,25) T(28,26) T(27,27) T(26,28) T(25,29) T(24,30) T(23,31) T(22,32) T(23,32) T(24,31) T(25,30) T(26,29) T(27,28) T(28,27) T(29,26) T(30,25) T(31,24) T(32,23) T(32,24) ...
    T(31,25) T(30,26) T(29,27) T(28,28) T(27,29) T(26,30) T(25,31) T(24,32) T(25,32) T(26,31) T(27,30) T(28,29) T(29,28) T(30,27) T(31,26) T(32,25) T(32,26) T(31,27) T(30,28) T(29,29) ...
	T(28,30) T(27,31) T(26,32) T(27,32)  T(28,31) T(29,30) T(30,29) T(31,28) T(32,27) T(32,28) T(31,29) T(30,30) T(29,31) T(28,32) T(29,32) T(30,31) T(31,30) T(32,29) T(32,30) T(31,31)...
    T(30,32) T(31,32) T(32,31) T(32,32)];
