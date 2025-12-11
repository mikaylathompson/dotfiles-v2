#!/bin/bash

# Claude Code statusline script
# Displays: model | cwd | git_branch | $cost | +added/-removed

input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens')

# Truncate long paths from the left
display_cwd="$cwd"
# Replace home directory with ~
display_cwd="${display_cwd/#$HOME/~}"
# If still longer than 40 chars, truncate from left
if [ ${#display_cwd} -gt 40 ]; then
  display_cwd="...${display_cwd: -37}"
fi

cd "$cwd" 2>/dev/null

git_branch=$(git branch --show-current 2>/dev/null || echo 'no-git')

# Calculate costs (Sonnet 4.5 pricing: $3/M input, $15/M output)
input_cost=$(echo "scale=4; $total_input * 3 / 1000000" | bc 2>/dev/null || echo '0')
output_cost=$(echo "scale=4; $total_output * 15 / 1000000" | bc 2>/dev/null || echo '0')
total_cost=$(echo "scale=2; $input_cost + $output_cost" | bc 2>/dev/null || echo '0')

# Get git diff stats
git_stats=$(git -c core.fileMode=false diff --numstat 2>/dev/null | awk '{added+=$1; removed+=$2} END {if(added>0 || removed>0) printf "+%d/-%d", added, removed}')

# Build status string
status="$model | $display_cwd | $git_branch"
if [ "$total_cost" != "0" ] && [ "$total_cost" != "0.00" ]; then
  status="$status | \$$total_cost"
fi
if [ -n "$git_stats" ]; then
  status="$status | $git_stats"
fi

echo "$status"
