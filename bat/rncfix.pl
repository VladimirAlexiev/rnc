#!perl -wp0

BEGIN {binmode (STDIN, ":crlf")}

s{\t+}{ }g;
s{^ +" "\n}{}gm;
s{namespace ns_1 = "http://relaxng.org/ns/compatibility/annotations/1.0"\n}{}; # namespace a is the same
s{ns_1:}{a:}g;
s{( +)["'](.*)\\x\{a\}["'] ~}{$1##$2}g;
s{(.*)\n +>> a:documentation \[\n ((?: +##.*\n)+) *\]([,?]?)\n}{$2$1$3\n}g;
         s{ *a:documentation \[\n ((?: +##.*\n)+) *\]([,?]?)\n}{$1$2\n}g;
s{  >> a:documentation \[ ## " *(.*?)" \]\n}{## $1\n}g;
s{  >> a:documentation \[\n +" +(.*?)"\n +\]\n}{## $1\n}g;
s{^( *#*)  +}{$1 }gm; # remove extraneous whitespace
s{^ *#* *\n}{}gm;     # remove extraneous newlines
s{\n *\}}{\}}g;
s{([=\{]\n) *\n}{$1}g;
s{\{ }{\{}g;
s{ \}}{\}}g;
s{(\n *[^#].*\n)(?=\w|#)(?!default|namespace)}{$1\n}g; # add newline before definition (word or comment starting at BOL)
