function fish_greeting
  set -a ironic_greeting_messages "**** COMMODORE 64 BASIC V2 ****"
  set -a ironic_greeting_messages "Microsoft(R) MS-DOS(R) Version 6.22"
  set -a ironic_greeting_messages "Starting Windows ME..."

  echo (random choice $ironic_greeting_messages)
end
