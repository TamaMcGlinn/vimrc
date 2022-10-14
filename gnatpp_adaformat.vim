let g:formatdef_customized_gnatpp = "'cat > /tmp/adafile; gnatpp --decimal_grouping=3 --based-grouping=4 --max-line-length=100 --no-compact --pipe /tmp/adafile; rm -f /tmp/adafile'"
let g:formatters_ada = ['customized_gnatpp']
