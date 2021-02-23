
function! BazelGetCurrentBufTarget() abort
    let bazel_file_label=system('bazel query ' . bufname('%') . " --color no --curses no --noshow_progress 2>/dev/null | tr -d '[:space:]'")
    let bazel_file_package=split(bazel_file_label, ':')[0]
    return system("bazel query \"attr('srcs', " . bazel_file_label . ', ' . bazel_file_package . ":*)\" --color no --curses no --noshow_progress  2>/dev/null | tr -d '[:space:]'")
endfunction

function! BazelBuildHere() abort
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!./bazel.py build ' . l:current_bazel_target
endfunction

function! BazelTestHere()
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!./bazel.py test ' . l:current_bazel_target
endfunction

nnoremap <leader>bb :call BazelBuildHere()<CR>
nnoremap <leader>bt :call BazelTestHere()<CR>
