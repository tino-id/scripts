# Personal Scripts Collection

A collection of useful shell scripts for common development and system administration tasks.

## Contents

| Script | Description | Usage |
|--------|-------------|-------|
| `mysql_import.sh` | Import a .sql.gz file from a MySQL backup to a local database | `./mysql_import.sh backup.sql.gz` |

## Installation

```bash
# Clone this repository to your ~/bin directory
git clone https://github.com/tino-id/scripts.git ~/bin

# Make scripts executable
chmod +x ~/bin/*.sh

# Ensure ~/bin is in your PATH
echo 'export PATH=.:~/bin:$PATH' >> ~/.bashrc  # or ~/.zshrc
source ~/.bashrc  # or source ~/.zshrc
```

## Script Details

### mysql_import.sh

Imports compressed SQL backups into a MySQL database.

**Features:**
- Validates input files are properly formatted (.sql.gz extension)
- Shows progress using `pv` utility
- Pipes decompressed SQL directly to MySQL

**Usage:**
```bash
mysql_import.sh path/to/backup.sql.gz
```

**Dependencies:**
- `pv` (Pipe Viewer)
- `gunzip`
- `mysql` client

## License

MIT License. Feel free to use and modify as needed.