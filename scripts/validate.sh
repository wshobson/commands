#!/bin/bash
# Validate all slash command files in the repository
# Usage: ./scripts/validate.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

echo "Validating slash commands..."
echo "=============================="

# Valid model names
VALID_MODELS=(
    "claude-opus-4-5-20251101"
    "claude-sonnet-4-20250514"
    "claude-haiku-3-5-20241022"
)

# Valid subagent types
VALID_SUBAGENTS=(
    "general-purpose"
    "Explore"
    "Plan"
    "claude-code-guide"
)

# Find all markdown files in command directories
COMMAND_DIRS="core tdd api security devops workflows"

for dir in $COMMAND_DIRS; do
    if [ -d "$dir" ]; then
        for file in "$dir"/*.md; do
            [ -f "$file" ] || continue

            echo -n "Checking $file... "
            FILE_ERRORS=0

            # Check for YAML frontmatter
            if ! head -1 "$file" | grep -q "^---$"; then
                echo -e "${RED}ERROR${NC}: Missing YAML frontmatter"
                ((ERRORS++))
                ((FILE_ERRORS++))
            fi

            # Check for model specification
            MODEL=$(grep -m1 "^model:" "$file" 2>/dev/null | sed 's/model: *//')
            if [ -z "$MODEL" ]; then
                echo -e "${RED}ERROR${NC}: Missing model specification"
                ((ERRORS++))
                ((FILE_ERRORS++))
            else
                # Validate model name
                VALID=0
                for valid_model in "${VALID_MODELS[@]}"; do
                    if [ "$MODEL" = "$valid_model" ]; then
                        VALID=1
                        break
                    fi
                done
                if [ $VALID -eq 0 ]; then
                    echo -e "${YELLOW}WARNING${NC}: Unknown model '$MODEL'"
                    ((WARNINGS++))
                fi
            fi

            # Check for $ARGUMENTS placeholder
            if ! grep -q '\$ARGUMENTS' "$file"; then
                echo -e "${YELLOW}WARNING${NC}: Missing \$ARGUMENTS placeholder"
                ((WARNINGS++))
            fi

            # Check for invalid subagent types
            while IFS= read -r line; do
                subagent=$(echo "$line" | grep -o 'subagent_type="[^"]*"' | sed 's/subagent_type="//;s/"//')
                if [ -n "$subagent" ]; then
                    VALID=0
                    for valid_subagent in "${VALID_SUBAGENTS[@]}"; do
                        if [ "$subagent" = "$valid_subagent" ]; then
                            VALID=1
                            break
                        fi
                    done
                    if [ $VALID -eq 0 ]; then
                        echo -e "${RED}ERROR${NC}: Invalid subagent_type '$subagent'"
                        ((ERRORS++))
                        ((FILE_ERRORS++))
                    fi
                fi
            done < "$file"

            # Check file size (warn if over 200 lines)
            LINES=$(wc -l < "$file")
            if [ "$LINES" -gt 200 ]; then
                echo -e "${YELLOW}WARNING${NC}: File has $LINES lines (consider reducing)"
                ((WARNINGS++))
            fi

            if [ $FILE_ERRORS -eq 0 ]; then
                echo -e "${GREEN}OK${NC}"
            fi
        done
    fi
done

echo ""
echo "=============================="
echo "Validation complete"
echo -e "Errors: ${RED}$ERRORS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"

if [ $ERRORS -gt 0 ]; then
    exit 1
fi
exit 0
