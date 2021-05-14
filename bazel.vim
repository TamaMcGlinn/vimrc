
function! BazelGetCurrentBufTarget() abort
    let bazel_query_begin = 'bazel query ' . bufname('%')
    let bazel_file_label=system(bazel_query_begin . " --color no --curses no --noshow_progress 2>/dev/null | tr -d '[:space:]'")
    if bazel_file_label ==# ''
      throw 'No output from: ' . bazel_query_begin
    endif
    return split(bazel_file_label, ':')[0]
    " I'm confused why I used to think the below was also necessary
    let bazel_file_package=split(bazel_file_label, ':')[0]
    return system("bazel query \"attr('srcs', " . bazel_file_label . ', ' . bazel_file_package . ":*)\" --color no --curses no --noshow_progress  2>/dev/null | tr -d '[:space:]'")
endfunction

function! BazelBuildHere() abort
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!bazel build ' . l:current_bazel_target
endfunction

function! BazelTestHere() abort
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    execute '!bazel test ' . l:current_bazel_target
endfunction

function! PutTargetInTermBelow(prefix, ...) abort
    let l:postfix = get(a:, 1, '')
    let l:current_bazel_target = BazelGetCurrentBufTarget()
    " switch to bottom buffer
    silent execute 'wincmd j'
    call feedkeys("a" . a:prefix . l:current_bazel_target . l:postfix . "\<CR>")
endfunction

