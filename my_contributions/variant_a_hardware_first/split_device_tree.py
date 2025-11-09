#!/usr/bin/env python3
"""
Split fullDeviceDirTree.md into separate files per top-level directory
"""

import re
import os
from pathlib import Path

def extract_directory_sections(filepath):
    """Extract the tree structure and split by top-level directories"""
    
    # Top-level directories from the ls output
    toplevel_dirs = [
        'Reserve0', 'acct', 'apex', 'bin', 'bugreports', 'cache', 'config',
        'd', 'data', 'data_mirror', 'debug_ramdisk', 'default.prop', 'dev',
        'etc', 'init', 'init.environ.rc', 'init.recovery.sun50iw12p1.rc',
        'linkerconfig', 'lost+found', 'metadata', 'mnt', 'odm', 'oem',
        'postinstall', 'proc', 'product', 'sdcard', 'storage', 'sys',
        'system', 'system_ext', 'vendor'
    ]
    
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # Dictionary to store content for each directory
    dir_content = {d: [] for d in toplevel_dirs}
    current_dir = None
    
    # Parse the tree structure
    for line in lines:
        # Skip the initial line with just "."
        if line.strip() == '.':
            continue
        
        # Check if this line starts a new top-level entry
        matched = False
        for dirname in toplevel_dirs:
            # Look for patterns like "├── dirname" or "└── dirname"
            if re.search(rf'[├└]── {re.escape(dirname)}', line):
                current_dir = dirname
                matched = True
                break
        
        if matched:
            dir_content[current_dir].append(line)
        elif current_dir:
            dir_content[current_dir].append(line)
    
    return dir_content, toplevel_dirs

def create_directory_docs(base_path, content_dict, toplevel_dirs):
    """Create individual markdown files for each directory"""
    
    # Create device-tree-analysis directory if it doesn't exist
    analysis_dir = os.path.join(base_path, 'device-tree-analysis')
    os.makedirs(analysis_dir, exist_ok=True)
    
    for dirname in toplevel_dirs:
        if not content_dict[dirname]:  # Skip empty directories
            continue
        
        filename = f'{dirname.replace("/", "_")}.md'
        filepath = os.path.join(analysis_dir, filename)
        
        # Create header with metadata
        header = f"""# {dirname} Directory Tree

This file contains the complete directory tree for `/{dirname}` extracted from the HY300 device.

**Generated:** 2025-11-08
**Source:** `fullDeviceDirTree.md`
**Content Size:** {len(content_dict[dirname])} lines

---

## Tree Structure

\`\`\`
"""
        
        # Get content and strip extra whitespace
        content_lines = content_dict[dirname]
        content = ''.join(content_lines).strip()
        
        footer = """
```

---

**Notes:**
- Symlinks are marked with `lw-` prefixes
- Directories are listed with their permissions and ownership
- Generated from `tree` command output on running device
"""
        
        full_content = header + content + footer
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(full_content)
        
        print(f"✓ Created: {filename} ({len(content_lines)} lines)")

if __name__ == '__main__':
    base_path = '/home/luca/Desktop/hy300-linux-porting'
    filepath = os.path.join(base_path, 'fullDeviceDirTree.md')
    
    print("Parsing fullDeviceDirTree.md...")
    content_dict, toplevel_dirs = extract_directory_sections(filepath)
    
    print("Creating individual directory documentation files...")
    create_directory_docs(base_path, content_dict, toplevel_dirs)
    
    print(f"\n✓ All files created in: device-tree-analysis/")
