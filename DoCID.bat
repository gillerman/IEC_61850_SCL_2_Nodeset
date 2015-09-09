@echo off

"C:\Program Files (x86)\Altova\AltovaXML2013\AltovaXML" /xslt2 "CID2UANodeSet2.xsl" /in "61850TestCID.xml" /out "IEC_61850_UANodeSetB2.xml" %*
IF ERRORLEVEL 1 EXIT/B %ERRORLEVEL%
