function M = moveLRRVC(F, d)
%------------------------------------------------------------------------------
% Moves gridfunction F in horizontal direction.
% Excess area is filled by Vertex-Centered (VC) Reflection across boundaries.
%
% Design and implementation by:
% Dr. Paul M. de Zeeuw <Paul.de.Zeeuw@cwi.nl>  http://homepages.cwi.nl/~pauldz/
% Last Revision: June 23, 2000.
% (c) 1999-2002 Stichting CWI, Amsterdam
%------------------------------------------------------------------------------
M = moveUDRVC(F.', d).';
%------------------------------------------------------------------------------
