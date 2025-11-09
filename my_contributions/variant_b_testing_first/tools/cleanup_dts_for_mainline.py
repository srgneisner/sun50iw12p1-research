#!/usr/bin/env python3
"""
Clean up Allwinner H713 device tree for mainline Linux.

Removes Android-specific nodes and prepares DTS for kernel integration.
Input: Factory DTB (converted to DTS)
Output: Mainline-ready DTS
"""

import sys
import re
from pathlib import Path


def clean_dts(content):
    """Remove Android-specific nodes and prepare for mainline."""
    
    lines = content.split('\n')
    output_lines = []
    skip_until_close = False
    brace_depth = 0
    in_android_block = False
    
    for i, line in enumerate(lines):
        # Track brace depth
        brace_depth += line.count('{')
        brace_depth -= line.count('}')
        
        # Skip Android firmware block
        if re.search(r'android\s*{', line):
            in_android_block = True
            skip_until_close = True
            continue
        
        if skip_until_close and brace_depth == 0:
            skip_until_close = False
            in_android_block = False
            continue
        
        if in_android_block and skip_until_close:
            continue
        
        # Remove Android vbmeta references
        if 'vbmeta' in line:
            continue
        
        # Remove firmware-loader references
        if 'firmware-loader' in line or 'firmware_loader' in line:
            continue
        
        # Remove fstab references (Android specific)
        if 'fstab' in line:
            continue
        
        # Remove vendor-specific nodes
        if re.search(r'vendor|vendor-', line):
            if 'vendor-specific' in line or 'vendor {' in line:
                skip_until_close = True
                brace_depth += line.count('{')
                continue
        
        output_lines.append(line)
    
    return '\n'.join(output_lines)


def normalize_dts(content):
    """Normalize DTS formatting for mainline compatibility."""
    
    # Convert phandle references from decimal to hex if needed
    # Ensure proper spacing around braces
    lines = content.split('\n')
    normalized = []
    
    for line in lines:
        # Skip empty lines but preserve structure
        if line.strip():
            normalized.append(line)
        elif normalized and normalized[-1].strip():  # Keep one empty line max
            normalized.append(line)
    
    return '\n'.join(normalized)


def main():
    if len(sys.argv) < 2:
        print("Usage: cleanup_dts_for_mainline.py <input.dts> [output.dts]")
        sys.exit(1)
    
    input_file = Path(sys.argv[1])
    output_file = Path(sys.argv[2]) if len(sys.argv) > 2 else input_file.with_name(
        input_file.stem + '-mainline.dts'
    )
    
    if not input_file.exists():
        print(f"Error: {input_file} not found")
        sys.exit(1)
    
    print(f"📖 Reading: {input_file}")
    content = input_file.read_text()
    orig_lines = len(content.split('\n'))
    
    print(f"🧹 Cleaning Android-specific nodes...")
    content = clean_dts(content)
    
    print(f"📝 Normalizing formatting...")
    content = normalize_dts(content)
    
    final_lines = len(content.split('\n'))
    removed = orig_lines - final_lines
    
    print(f"✅ Writing: {output_file}")
    output_file.write_text(content)
    
    print(f"\n📊 Statistics:")
    print(f"   Original lines: {orig_lines}")
    print(f"   Final lines:    {final_lines}")
    print(f"   Removed:        {removed}")
    print(f"   Reduction:      {100*removed/orig_lines:.1f}%")


if __name__ == '__main__':
    main()
