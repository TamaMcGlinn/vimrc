
function! BazelGetCurrentBufTarget() abort
    let bazel_query_begin = 'bazel query ' . bufname('%')
    let bazel_file_label=system(bazel_query_begin . " --color no --curses no --noshow_progress 2>/dev/null")
    if bazel_file_label ==# ''
      throw 'No output from: ' . bazel_query_begin
    endif
    let bazel_file_package=split(bazel_file_label, ':')[0]
    return system("bazel query \"attr('srcs', " . bazel_file_label . ', ' . bazel_file_package . ":*)\" --color no --curses no --noshow_progress  2>/dev/null | tr -d '[:space:]'")
endfunction

function! BazelBuildHere() abort
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!./bazel.py build ' . l:current_bazel_target
endfunction

function! BazelTestHere() abort
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!./bazel.py test ' . l:current_bazel_target
endfunction

function! PutTargetInTermBelow(...) abort
    let l:prefix = get(a:, 1, '')
    if l:prefix ==# ''
      l:prefix = l:prefix . ' '
    endif
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    " switch to bottom buffer
    silent execute 'wincmd j'
    call feedkeys("a" . l:prefix . l:current_bazel_target)
endfunction

