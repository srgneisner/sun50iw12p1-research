#!/usr/bin/env python3
"""
Split FullDir.xml into separate files per top-level directory
Uses XML structure for accurate parsing
"""

import xml.etree.ElementTree as ET
import os
from pathlib import Path

def parse_xml_tree(filepath):
    """Parse XML and extract top-level directories"""
    
    tree = ET.parse(filepath)
    root = tree.getroot()
    
    # Get root directory element
    root_dir = root.find('directory[@name="."]')
    if root_dir is None:
        print("Error: Could not find root directory in XML")
        return {}
    
    # Extract all top-level directories
    toplevel = {}
    
    for child in root_dir:
        if child.tag == 'directory':
            dirname = child.get('name')
            toplevel[dirname] = child
        elif child.tag == 'symlink':
            linkname = child.get('name')
            toplevel[linkname] = child
    
    return toplevel

def element_to_markdown_tree(element, indent=0):
    """Convert XML element tree to markdown tree format"""
    lines = []
    
    name = element.get('name', 'unknown')
    mode = element.get('mode', '')
    prot = element.get('prot', '')
    
    # Root marker
    if name == '.':
        lines.append('.')
    else:
        prefix = '  ' * indent
        if element.tag == 'directory':
            lines.append(f'{prefix}├── {name}/ ({prot})')
        elif element.tag == 'symlink':
            target = element.get('target', '')
            lines.append(f'{prefix}├── {name} -> {target}')
        else:
            lines.append(f'{prefix}├── {name}')
    
    # Process children
    children = list(element)
    for i, child in enumerate(children):
        is_last = (i == len(children) - 1)
        child_lines = element_to_markdown_tree(child, indent + 1)
        lines.extend(child_lines)
    
    return lines

def count_items(element):
    """Count files and directories recursively"""
    files = 0
    dirs = 0
    
    for child in element:
        if child.tag == 'directory':
            dirs += 1
            child_files, child_dirs = count_items(child)
            files += child_files
            dirs += child_dirs
        elif child.tag == 'file':
            files += 1
        elif child.tag == 'symlink':
            files += 1
    
    return files, dirs

def create_directory_docs(base_path, toplevel_dirs):
    """Create individual markdown files for each directory"""
    
    # Create device-tree-analysis directory if it doesn't exist
    analysis_dir = os.path.join(base_path, 'device-tree-analysis')
    os.makedirs(analysis_dir, exist_ok=True)
    
    # Sort by name for consistent ordering
    sorted_dirs = sorted(toplevel_dirs.items())
    
    stats = []
    
    for dirname, element in sorted_dirs:
        filename = f'{dirname.replace("/", "_")}.md'
        filepath = os.path.join(analysis_dir, filename)
        
        # Count items
        file_count, dir_count = count_items(element)
        
        # Create header with metadata
        header = f"""# Directory: {dirname}

This file contains the complete directory tree for `/{dirname}` extracted from the HY300 device.

**Generated:** 2025-11-08  
**Source:** `FullDir.xml`  
**Items:** {file_count} files, {dir_count} subdirectories  
**Type:** {'Symlink' if element.tag == 'symlink' else 'Directory'}

---

## Tree Structure

```
"""
        
        # Convert element tree to text
        if element.tag == 'symlink':
            target = element.get('target', '')
            content = f"{dirname} -> {target}"
        else:
            tree_lines = element_to_markdown_tree(element)
            content = '\n'.join(tree_lines)
        
        footer = """
```

---

"""
        
        full_content = header + content + footer
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(full_content)
        
        stats.append((dirname, filename, file_count, dir_count, element.tag))
        print(f"✓ {filename:30} | {file_count:6} files, {dir_count:6} dirs")
    
    return stats

def create_index(base_path, stats):
    """Create comprehensive index file"""
    
    # Calculate totals
    total_files = sum(s[2] for s in stats)
    total_dirs = sum(s[3] for s in stats)
    
    index_content = f"""# HY300 Device Tree Analysis - Complete Directory Index

This directory contains the complete filesystem tree of the HY300 Android device, split by top-level directory.

**Source:** `FullDir.xml` (620,722 lines)  
**Date:** 2025-11-08  
**Total:** {total_files} files + {total_dirs} subdirectories across {len(stats)} top-level entries

---

## All Top-Level Entries ({len(stats)})

"""
    
    # Categorize entries
    real_dirs = [s for s in stats if s[4] == 'directory']
    symlinks = [s for s in stats if s[4] == 'symlink']
    
    index_content += f"""
### Real Directories ({len(real_dirs)})

| Name | File | Files | Subdirs | Purpose |
|------|------|-------|---------|---------|
"""
    
    # Add directory entries
    for dirname, filename, files, dirs, _ in real_dirs:
        # Add categorization
        if dirname in ['sys', 'd', 'proc']:
            purpose = "Kernel/System info"
        elif dirname in ['dev']:
            purpose = "Device nodes"
        elif dirname in ['data', 'data_mirror', 'cache']:
            purpose = "User/App data"
        elif dirname in ['mnt', 'storage', 'sdcard']:
            purpose = "Mount points"
        elif dirname in ['bin', 'init', 'etc']:
            purpose = "System executables/config"
        elif dirname in ['system', 'system_ext', 'product', 'vendor', 'odm']:
            purpose = "System partitions"
        elif dirname in ['apex']:
            purpose = "Android modules"
        elif dirname in ['metadata', 'linkerconfig', 'config']:
            purpose = "System metadata"
        elif dirname in ['debug_ramdisk', 'postinstall', 'linkerconfig']:
            purpose = "Special partitions"
        else:
            purpose = "Other"
        
        index_content += f"| [{dirname}]({filename}) | [{filename}]({filename}) | {files:,} | {dirs:,} | {purpose} |\n"
    
    if symlinks:
        index_content += f"""

### Symlinks ({len(symlinks)})

| Name | File | Target |
|------|------|--------|
"""
        for dirname, filename, files, dirs, _ in symlinks:
            # Read target from the markdown file to get it
            index_content += f"| `{dirname}` | [{filename}]({filename}) | (see file) |\n"
    
    # Add statistics section
    index_content += f"""

## Statistics

### Largest Directories (by files)

"""
    
    sorted_by_files = sorted(real_dirs, key=lambda x: x[2], reverse=True)
    for dirname, filename, files, dirs, _ in sorted_by_files[:10]:
        index_content += f"- **{dirname}** - {files:,} files, {dirs:,} subdirs → [{filename}]({filename})\n"
    
    index_content += f"""

### Largest Directories (by subdirectories)

"""
    
    sorted_by_dirs = sorted(real_dirs, key=lambda x: x[3], reverse=True)
    for dirname, filename, files, dirs, _ in sorted_by_dirs[:10]:
        index_content += f"- **{dirname}** - {files:,} files, {dirs:,} subdirs → [{filename}]({filename})\n"
    
    # Write index
    index_path = os.path.join(base_path, 'device-tree-analysis', 'README.md')
    with open(index_path, 'w', encoding='utf-8') as f:
        f.write(index_content)
    
    print(f"\n✓ Index created: README.md")

if __name__ == '__main__':
    base_path = '/home/luca/Desktop/hy300-linux-porting'
    filepath = os.path.join(base_path, 'FullDir.xml')
    
    print("Parsing FullDir.xml...")
    toplevel_dirs = parse_xml_tree(filepath)
    print(f"Found {len(toplevel_dirs)} top-level entries\n")
    
    print("Creating individual directory documentation files...\n")
    stats = create_directory_docs(base_path, toplevel_dirs)
    
    print("\nCreating index...")
    create_index(base_path, stats)
    
    print(f"\n✓ All files created in: device-tree-analysis/")
