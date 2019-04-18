
function! s:InstallRustEnv()
    if !isdirectory(expand("~/bin/racer"))
    system("git clone https://github.com/phildawes/racer.git ~/bin/racer")
    system("cd ~/bin/racer;cargo build --release")
    endif
endfunction
