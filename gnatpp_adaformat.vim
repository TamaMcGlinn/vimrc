let g:formatdef_customized_gnatpp = "'cat > /tmp/adafile; gnatpp --alignment --separate-then --decimal_grouping=3 --indentation=3 --indent-continuation=2 --par-threshold=4 --vertical-named-aggregates --vertical-enum-types --vertical-case-alternatives --based-grouping=4 --max-line-length=100 --name-mixed-case --type-case-as-declared --dictionary=ada.pp --no-compact --pipe /tmp/adafile; rm -f /tmp/adafile'"
let g:formatters_ada = ['customized_gnatpp']
