includeDirs=`find . -type d | grep -i 'source' | grep -vi 'test' | sed 's/^\.\//\-I/g' | paste -sd " " -`
find . -type f -name '*.ali' | xargs gnat xref $includeDirs -vf | grep 'C:\|D:' | sort > tags
cat tags >> ../tags
sort ../tags | uniq > newglobaltags
mv newglobaltags ../tags
