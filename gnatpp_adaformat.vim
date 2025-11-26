let g:formatdef_customized_gnatpp = "'cat > /tmp/adafile; cd $PWD; cd $(git rev-parse --show-toplevel); gnatpp -P spark_config/shared.gpr --pipe /tmp/adafile; rm -f /tmp/adafile'"
let g:formatters_ada = ['customized_gnatpp']
