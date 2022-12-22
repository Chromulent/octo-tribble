# Remove Parentheses and all content within
for f in *'('*')'*; do mv -i "$f" "${f/(*)/}"; done

# Remove Brackets but keep contents within
find . -type f -iname "*[*" | while IFS= read -r line; do mv "$line" "$(printf %s "$line" | sed -re 's/(\[|\])//g')"; done;
