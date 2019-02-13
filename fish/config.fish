source /usr/local/opt/asdf/asdf.fish

set GOPATH $HOME/go                                                                  
set PATH $GOPATH/bin $PATH  

alias ls='gls --color=auto'
alias ll='ls -al'
alias less='less -R'

alias settings_edit='nvim ~/.config/fish/config.fish'
alias settings_reload='fish ~/.config/fish/config.fish'
alias reload='settings_reload'

# Functionは必要があればfunctionsディレクトリに切り出す。
function cd                                                                                
  builtin cd $argv[1]
  ls
end

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
 
function fish_prompt
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end

function ranger-cd                                                               
  set tempfile '/tmp/chosendir'                                                  
  ranger --choosedir=$tempfile (pwd)                                    

  if test -f $tempfile                                                           
      if [ (cat $tempfile) != (pwd) ]                                            
        cd (cat $tempfile)                                                       
      end                                                                        
  end                                                                            

  rm -f $tempfile                                                                
end                                                                              

function fish_user_key_bindings                                                  
    bind \co 'ranger-cd ; fish_prompt'                                           
end
