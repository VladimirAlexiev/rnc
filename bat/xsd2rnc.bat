xsltproc -o "%~n1.rng" c:\prog\bin\XSDtoRNG.xsl %1
@REM grep -vh rng:include "%~n1-tmp.rng" > "%~n1.rng"
java -jar c:\prog\bin\trang.jar "%~n1.rng" "%~n1-tmp.rnc"
@REM del "%~n1-tmp.rng"
perl -wp0 c:\prog\bin\rncfix.pl "%~n1-tmp.rnc" > "%~n1.rnc"
del "%~n1-tmp.rnc"
