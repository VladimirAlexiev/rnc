xsltproc -o %~n1.rng c:\prog\bin\XSDtoRNG.xsl %1
trang %~n1.rng %~n1-tmp.rnc
rncfix %~n1-tmp.rnc > %~n1.rnc
del %~n1-tmp.rnc
