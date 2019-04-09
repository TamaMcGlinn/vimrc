echo "!_TAG_FILE_SORTED 1 /0=unsorted, 1=sorted, 2=foldcase/" > tags
find . -type d | grep -i '\./[a-z]*/source' \
  | grep -vi 'test\|aonix\|64' \
  | sed 's/^\.\//src_dir=/g' > gnat_xref_configuration.txt
# find . -type f -name "*.ali" | grep -v 'CodeCAT' | sed 's/\/[^\/]*$//g' | sort | uniq \
#   | sed 's/^\.\//obj_dir=/g' >> gnat_xref_configuration.txt
find . -type f -name '*.ali' | xargs gnat xref -pgnat_xref_configuration.txt -vf \
  | grep 'C:\|D:' \
  | sort >> tags
rm gnat_xref_configuration.txt
