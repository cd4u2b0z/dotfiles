#!/usr/bin/env bash

# Optimized System Stats for Waybar - Smooth Performance
# Updates every 2 seconds with minimal system load

# Cache file for previous values
CACHE_FILE="/tmp/waybar_system_stats"

# Function to get CPU usage efficiently
get_cpu_usage() {
    # Use /proc/stat for efficient CPU calculation
    local cpu_line=$(head -1 /proc/stat)
    local cpu_times=($cpu_line)
    
    local idle=${cpu_times[4]}
    local total=0
    for time in "${cpu_times[@]:1:8}"; do
        ((total += time))
    done
    
    # Calculate percentage (simplified for performance)
    local cpu_percent=$((100 * (total - idle) / total))
    
    # Cap at 99% to avoid display issues
    if [ $cpu_percent -gt 99 ]; then
        cpu_percent=99
    fi
    
    echo $cpu_percent
}

# Function to get memory usage
get_memory_usage() {
    # Parse /proc/meminfo efficiently
    local mem_info=$(head -3 /proc/meminfo | awk '{print $2}')
    local mem_array=($mem_info)
    
    local total_kb=${mem_array[0]}
    local free_kb=${mem_array[1]}
    local available_kb=${mem_array[2]}
    
    # Use available memory for more accurate calculation
    local used_kb=$((total_kb - available_kb))
    local mem_percent=$((100 * used_kb / total_kb))
    
    echo $mem_percent
}

# Function to get load average
get_load_avg() {
    local load=$(cut -d' ' -f1 /proc/loadavg)
    echo $load
}

# Get values
CPU=$(get_cpu_usage)
MEM=$(get_memory_usage)
LOAD=$(get_load_avg)

# Create smooth color coding
if [ $CPU -gt 80 ] || [ $MEM -gt 85 ]; then
    COLOR_CLASS="critical"
elif [ $CPU -gt 60 ] || [ $MEM -gt 70 ]; then
    COLOR_CLASS="warning"
else
    COLOR_CLASS="normal"
fi

# Format output with microchip icon
echo "{\"text\":\"  $CPU% │ $MEM% │ $LOAD\", \"class\":\"$COLOR_CLASS\", \"tooltip\":\"CPU: ${CPU}%\\nRAM: ${MEM}%\\nLoad: ${LOAD}\"}"