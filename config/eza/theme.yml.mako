<% from theme import color_hash %>\
colourful: true

filekinds:
  normal: { foreground: "${color_hash("ansi_white")}" }
  directory: { foreground: "${color_hash("primary_12")}" }
  symlink: { foreground: "${color_hash("ansi_brcyan")}" }
  pipe: { foreground: "${color_hash("ansi_bryellow")}" }
  block_device: { foreground: "${color_hash("ansi_brmagenta")}" }
  char_device: { foreground: "${color_hash("ansi_magenta")}" }
  socket: { foreground: "${color_hash("ansi_bryellow")}" }
  special: { foreground: "${color_hash("debug")}" }
  executable: { foreground: "${color_hash("ansi_brgreen")}" }
  mount_point: { foreground: "${color_hash("debug")}" }

perms:
  user_read: { foreground: "${color_hash("ansi_blue")}" }
  user_write: { foreground: "${color_hash("ansi_cyan")}" }
  user_execute_file: { foreground: "${color_hash("ansi_green")}" }
  user_execute_other: { foreground: "${color_hash("debug")}" }
  group_read: { foreground: "${color_hash("ansi_blue")}" }
  group_write: { foreground: "${color_hash("ansi_cyan")}" }
  group_execute: { foreground: "${color_hash("ansi_green")}" }
  other_read: { foreground: "${color_hash("ansi_blue")}" }
  other_write: { foreground: "${color_hash("ansi_cyan")}" }
  other_execute: { foreground: "${color_hash("ansi_green")}" }
  special_user_file: { foreground: "${color_hash("ansi_brred")}" }
  special_other: { foreground: "${color_hash("ansi_brred")}" }
  attribute: { foreground: "${color_hash("debug")}" }

size:
  major: { foreground: "${color_hash("debug")}" }
  minor: { foreground: "${color_hash("debug")}" }
  number_byte: { foreground: "${color_hash("primary_10")}" }
  number_kilo: { foreground: "${color_hash("primary_11")}" }
  number_mega: { foreground: "${color_hash("primary_12")}" }
  number_giga: { foreground: "${color_hash("primary_13")}" }
  number_huge: { foreground: "${color_hash("primary_14")}" }
  unit_byte: { foreground: "${color_hash("primary_10")}" }
  unit_kilo: { foreground: "${color_hash("primary_11")}" }
  unit_mega: { foreground: "${color_hash("primary_12")}" }
  unit_giga: { foreground: "${color_hash("primary_13")}" }
  unit_huge: { foreground: "${color_hash("primary_14")}" }

users:
  user_you: { foreground: "${color_hash("ansi_brgreen")}" }
  user_root: { foreground: "${color_hash("ansi_bryellow")}" }
  user_other: { foreground: "${color_hash("ansi_brred")}" }
  group_yours: { foreground: "${color_hash("ansi_brgreen")}" }
  group_root: { foreground: "${color_hash("ansi_bryellow")}" }
  group_other: { foreground: "${color_hash("ansi_brred")}" }

links:
  normal: { foreground: "${color_hash("debug")}" }
  multi_link_file: { foreground: "${color_hash("debug")}" }

git:
  new: { foreground: "${color_hash("debug")}" }
  modified: { foreground: "${color_hash("debug")}" }
  deleted: { foreground: "${color_hash("debug")}" }
  renamed: { foreground: "${color_hash("debug")}" }
  typechange: { foreground: "${color_hash("debug")}" }
  ignored: { foreground: "${color_hash("debug")}" }
  conflicted: { foreground: "${color_hash("debug")}" }

git_repo:
  branch_main: { foreground: "${color_hash("debug")}" }
  branch_other: { foreground: "${color_hash("debug")}" }
  git_clean: { foreground: "${color_hash("debug")}" }
  git_dirty: { foreground: "${color_hash("debug")}" }

security_context:
  colon: { foreground: "${color_hash("debug")}" }
  user: { foreground: "${color_hash("debug")}" }
  role: { foreground: "${color_hash("debug")}" }
  typ: { foreground: "${color_hash("debug")}" }
  range: { foreground: "${color_hash("debug")}" }

file_type:
  image: { foreground: "${color_hash("green_6")}" }
  video: { foreground: "${color_hash("primary_10")}" }
  music: { foreground: "${color_hash("purple_6")}" }
  lossless: { foreground: "${color_hash("debug")}" }
  crypto: { foreground: "${color_hash("debug")}" }
  document: { foreground: "${color_hash("ansi_white")}" }
  compressed: { foreground: "${color_hash("ansi_red")}" }
  temp: { foreground: "${color_hash("debug")}" }
  compiled: { foreground: "${color_hash("debug")}" }
  build: { foreground: "${color_hash("ansi_bryellow")}" }
  source: { foreground: "${color_hash("secondary_13")}" }

punctuation: { foreground: "${color_hash("ansi_white")}" }
date: { foreground: "${color_hash("text_10")}" }
inode: { foreground: "${color_hash("debug")}" }
blocks: { foreground: "${color_hash("debug")}" }
header: { foreground: "${color_hash("debug")}" }
octal: { foreground: "${color_hash("debug")}" }
flags: { foreground: "${color_hash("debug")}" }

symlink_path: { foreground: "${color_hash("primary_10")}" }
control_char: { foreground: "${color_hash("debug")}" }
broken_symlink: { foreground: "${color_hash("ansi_red")}" }
broken_path_overlay: { foreground: "${color_hash("ansi_red")}" }