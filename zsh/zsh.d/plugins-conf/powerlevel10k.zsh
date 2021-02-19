POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir rbenv vcs status background_jobs)
#POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_LAST_PROMPT_PREFIX="↳"
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR_ICON=' '
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
#
#POWERLEVEL9K_DIR_HOME_BACKGROUND=0
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=0
if test -z "${ZSH_VERSION}"; then
  echo "purepower: unsupported shell; try zsh instead" >&2
  return 1
  exit 1
fi

() {
  emulate -L zsh && setopt no_unset pipe_fail

  if (( ARGC )); then
    echo -E "Usage: source ~/.purepower" >&2
    return 1
  fi

  local mode=${PURE_POWER_MODE:-fancy}
  case $mode in
    fancy)
      local vi_insert=$'\u276F'
      local vi_cmd=$'\u276E'
      local lock=$'\uF023'
      local incoming=$'\u21E3'
      local outgoing=$'\u21E1'
      local root=$'\uF09C'
      local jobs=$'\uF013'
      ;;
    *)
      if [[ $mode != portable ]]; then
        echo -En "purepower: invalid mode: ${(qq)mode}; " >&2
        echo -E  "valid options are 'fancy' and 'portable'; falling back to 'portable'" >&2
      fi
      local vi_insert='>'
      local vi_cmd='<'
      local lock='X'
      local incoming='<'
      local outgoing='>'
      local root='#'
      local jobs='%%'
      ;;
  esac

  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      dir_writable dir vcs)

  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status command_execution_time root_indicator background_jobs custom_rprompt time)

  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${vi_insert//\\/\\\\}//\}/\\\}}}"
    p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${vi_cmd//\\/\\\\}//\}/\\\}}}"
  else
    p=$vi_insert
  fi

  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{002}${p}%f.%F{009}${p}%f) "
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=' '

  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR=003
  typeset -g POWERLEVEL9K_LOCK_ICON=$lock

  typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT}_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND=209
  typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND=039
  typeset -g POWERLEVEL9K_{ETC,FOLDER,HOME,HOME_SUB}_ICON=

  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=076
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=014
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=011
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=001
  typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{GIT,GIT_GITHUB,GIT_BITBUCKET,GIT_GITLAB,BRANCH}_ICON=
  typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\b|'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\b?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\b!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'\b+'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$incoming
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$outgoing
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'\b#'

  typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=none
  typeset -g POWERLEVEL9K_ROOT_ICON=$root

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=002
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$jobs

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  typeset -g POWERLEVEL9K_EXECUTION_TIME_ICON=

  typeset -g POWERLEVEL9K_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=244
  typeset -g POWERLEVEL9K_TIME_ICON=

  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=009
  typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=

  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT=custom_rprompt
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_BACKGROUND=none
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_FOREGROUND=012

  function custom_rprompt() {}  # redefine this to show stuff in custom_rprompt segment
} "$@"